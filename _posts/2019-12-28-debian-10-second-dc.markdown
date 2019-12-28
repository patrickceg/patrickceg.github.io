---
layout: post
title:  "Debian 10 Active Directory Domain Controller with Samba: Adding a Second Domain Controller"
date:   2019-12-28 21:00:00
categories: tips
---

This post shows how to add a second domain controller to a domain that is already managed by a Debian 10 based domain controller.

## Operating System Setup

The setup is the same as [the setup for the first controller]({% post_url 2019-11-27-debian-10-dc-1-os-install%}).

Similar to the first domain controller install, make sure the hostname is already set up (in this article, I'm using _pyxis02_ as the host name and _volatile.homelab_ as the domain.

## Preparing for the Domain Join

1. Verify the machine's own IP is in /etc/hosts

    If the values from the install worked, this should already be set. Check by using `cat /etc/hosts`
~~~
    127.0.0.1       localhost
    192.168.211.31  pyxis02.volatile.homelab        pyxis02

    # The following lines are desirable for IPv6 capable hosts
    ::1     localhost ip6-localhost ip6-loopback
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
~~~

2. Install packages for the samba install: `apt install ntp samba smbclient samba-common-bin krb5-user winbind rsync unison dnsutils`
    * rysnc and unison are needed for the Unison based replication later on

3. Verify `/etc/resolv.conf` has the IP address of the domain controller `cat /etc/resolv.conf`
~~~
    search volatile.homelab
    nameserver 192.168.211.30
~~~

4. Edit /etc/krb5.conf in the libdefaults section to have the following block (keep the rest of the file)
    * Replace the VOLATILE.HOMELAB with your domain name
~~~
    [libdefaults]
        dns_lookup_realm = false
        dns_lookup_kdc = true
        default_realm = VOLATILE.HOMELAB
~~~

5. Verify the Kerberos setting works, replacing \[domain user\] with the name of a user on your pre-existing domain without the \[\] `kinit [domain user]`

6. Reboot the server

## Join the domain

1. Remove the existing samba configuration file: `rm /etc/samba/smb.conf`
2. Use samba-tool to join the domain
    * Replace the `-U"VOLATILE\mydomainadmin"` with the domain admin user (for example, if you haven't disabled it, the Administrator user can be used)
    * Replace the IP address from the `--option="dns forwarder = 192.168.211.5"`, 192.168.211.5 in my example with the DNS server you want to use for queries outside the domain
~~~
    samba-tool domain join volatile.homelab DC -U"VOLATILE\mydomainadmin" --dns-backend=SAMBA_INTERNAL --option="dns forwarder = 192.168.211.5" --option='idmap_ldb:use rfc2307 = yes'
~~~
3. Set all the services (each line is a separate command)
~~~
    systemctl stop smbd nmbd winbind
    systemctl disable smbd nmbd winbind
    systemctl mask smbd nmbd winbind
    systemctl unmask samba-ad-dc
    systemctl enable samba-ad-dc
~~~
4. Restart the server

## Set up Sysvol Replication 

Although the domain will work for domain users and DNS lookups, you need to set up sysvol replication to allow group policy to work. Note that you will generally execute commands as root on both the first and your newly set up secondary domain controller. Each step states which domain controller server to enter the commands in to.

1. On the primary domain controller, set up an SSH key for root
    * Make sure you're root with `su -`
    * As root, run the following:
~~~
    ssh-keygen -t ed25519
    cat /root/.ssh/id25519.pub.
~~~
    * Example of what comes out:
~~~
    cat /root/.ssh/id_ed25519.pub
    ssh-ed25519 AAAACXNzaC1lZDIXNTE5AAAAXH7zeITFPMQcXyxJnn2ZXPU4X40WwD39boaOU+2ABbAt root@pyxis01
~~~
2. On the secondary domain controller, copy that public key into authorized_hosts
    * Replace the string `AAAACXNzaC1lZDIXNTE5AAAAXH7zeITFPMQcXyxJnn2ZXPU4X40WwD39boaOU+2ABbAt root@pyxis01` with your own SSH public key that you generated
~~~
    echo "ssh-ed25519 AAAACXNzaC1lZDIXNTE5AAAAXH7zeITFPMQcXyxJnn2ZXPU4X40WwD39boaOU+2ABbAt root@pyxis01" > /root/.ssh/authorized_keys
    chmod 700 /root/.ssh
    chmod 600 /root/.ssh/authorized_keys
~~~
3. On the secondary domain controller, set up the SSD daemon to allow root login from the primary domain controller. (To clarify, this set of commands is run against the secondary domain controller.)
    1. Open /etc/ssh/sshd.config in a text editor `nano /etc/ssh/sshd.config`
    2. At the bottom of the file, add the following, replacing the IP address _192.168.211.30_ with your primary domain controller's IP address.
~~~
    Match Address 192.168.211.30
        PermitRootLogin prohibit-password 
~~~
    3. If your domain also has IPv6 enabled, you should also add an IPv6 address.
    4. Restart the SSH service `systemctl restart ssh`
4. Log in to the primary domain controller as root, and verify that the primary domain controller's _root_ can log in to the secondary domain controller as root.
    * Replace pyxis02 with the second domain controller
~~~
    ssh pyxis02
    ...
    Last login: Tue Dec 10 14:58:59 2019 from 192.168.211.30
    root@pyxis02:~#
~~~
5. Log in to the primary domain controller as root to set up the sysvol replication
    1. Install the rsync and unison packages: `apt install rsync unison`
    2. Create the log files for the sysvol
~~~
    touch /var/log/sysvol-sync.log
    chmod 640 /var/log/sysvol-sync.log
~~~
    3. Create the unison configuration file
        * Replace pyxis02.volatile.homelab with the name of your secondary domain controller
~~~
    install -o root -g root -m 0750 -d /root/.unison
    cat << EOF > /root/.unison/default.prf

    # Unison preferences file
    # Roots of the synchronization
    #
    # copymax & maxthreads params were set to 1 for easier troubleshooting.
    # Have to experiment to see if they can be increased again.
    root = /var/lib/samba
    # Note that 2 x / behind DC2, it is required
    root = ssh://root@pyxis02.volatile.homelab//var/lib/samba 
    # 
    # Paths to synchronize
    path = sysvol
    #
    #ignore = Path stats    ## ignores /var/www/stats
    auto=true
    batch=true
    perms=0
    rsync=true
    maxthreads=1
    retry=3
    confirmbigdeletes=false
    servercmd=/usr/bin/unison
    copythreshold=0
    copyprog = /usr/bin/rsync -XAavz --rsh='ssh -p 22' --inplace --compress
    copyprogrest = /usr/bin/rsync -XAavz --rsh='ssh -p 22' --partial --inplace --compress
    copyquoterem = true
    copymax = 1
    logfile = /var/log/sysvol-sync.log
    EOF
~~~
6. Craete a backup of the idmap.ldb file on the first domain controller. From the first domain controller, as root, execute:
~~~
    tdbbackup -s .bak /var/lib/samba/private/idmap.ldb
~~~
7. Still logged in as root on the primary domain controller, verify the backup was made (the tool doesn't seem to tell you if something got messed up).
    * Verify that the idmap.ldb.bak file exists (it's OK that its a diffrent size as the original file)
~~~
ls -lah /var/lib/samba/private
total 12M
drwx------  7 root root 4.0K Dec 10 14:24 .
drwxr-xr-x 10 root root 4.0K Nov 27 22:12 ..
...
-rw-------  1 root root 1.6M Nov 24 21:41 idmap.ldb
-rw-------  1 root root  80K Dec 10 14:24 idmap.ldb.bak
...
~~~
8. Still logged in as root on the primary domain controller, copy the file to the secondary domain controller.
    * Replace _root@pyxis02_ with your secondary domain controller's name
~~~
scp -v -4 /var/lib/samba/private/idmap.ldb.bak root@pyxis02:/var/lib/samba/private/idmap.ldb
~~~
9. Still logged in as root on the primary domain controller, perform the first sync.
~~~
/usr/bin/rsync -XAavz --log-file /var/log/sysvol-sync.log --delete-after -f"+ */" -f"- *"  /var/lib/samba/sysvol 
~~~
10. Log in to the secondary domain controller and verify the sync worked. Type:
~~~
    samba-tool ntacl sysvolreset
~~~
    * If the _samba-tool_ command has error messages, you're probably up for an hour of debugging from the [original documentation](https://wiki.samba.org/index.php/Joining_a_Samba_DC_to_an_Existing_Active_Directory#Built-in_User_.26_Group_ID_Mappings) 
11. Log back in to the primary controller and set up the unison script to run
    1. Run `crontab -e`
    2. At the bottom of the file, add the line `*/5 * * * * /usr/bin/rsync -XAavzq --log-file /var/log/sysvol-sync.log --delete-after -f"+ */" -f"- *"  /var/lib/samba/sysvol root@pyxis02:/var/lib/samba  && /usr/bin/unison -silent`


## References

* https://wiki.samba.org/index.php/Joining_a_Samba_DC_to_an_Existing_Active_Directory
* https://wiki.samba.org/index.php/SysVol_replication_(DFS-R)
* https://wiki.samba.org/index.php/Joining_a_Samba_DC_to_an_Existing_Active_Directory#Built-in_User_.26_Group_ID_Mappings
* https://wiki.samba.org/index.php/Bidirectional_Rsync/Unison_based_SysVol_replication_workaround