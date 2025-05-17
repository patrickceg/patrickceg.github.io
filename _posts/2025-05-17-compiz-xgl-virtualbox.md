---
layout: post
title:  "Compiz XGL Workaround to Avoid Corrupted Window Drawing in VirtualBox Guest"
date:   2025-05-17 00:01
categories: tips
---

This details how CompizConfig workaround "Fix Screen Updates in XGL with fgrlx."
fixes some display corruption when running a
[Debian 12](https://www.debian.org/releases/bookworm/)
[LXQT](https://wiki.debian.org/LXQt)
guest in [VirtualBox](https://www.virtualbox.org/)
with a [Windows 11 24H2](https://support.microsoft.com/en-us/topic/windows-11-version-24h2-update-history-0929c747-1815-4543-8461-0160d16f15e5)
host.

## Problem

My main computer is a used refurbished mobile workstation which
compared to a brand new laptop for 2025, is showing its age in
raw compute power despite having plenty of memory:

* Dell Precision 5540
* Intel Core i7-9850H
* 32GiB RAM
* 2TB SSD (Kingston SNV2S2000G)
* nVidia Quadro T1000

When running VirtualBox, in dual monitor mode, the machine struggled
and had the artifacts like the image below when interacting with
menus, dialogue boxes, or moving windows.

![LXQT Monitor Settings showing corruption artifacts after moving the window around a little](/assets/compiz-xgl/corrupted-graphics.png)

This would only happen in dual monitor mode
(specifically a 1920x1200 display and the laptop's own 1920x1080 displays)
because the laptop struggled to process the graphics when trying to render
two displays worth of pixels.
It was pinned on two CPU cores at 100% even with
[VMSVGA + 256 GB RAM assigned + 3D Acceleration in the VirtualBox settings](https://www.virtualbox.org/manual/ch03.html#settings-display).
The GPU was not under too much load, never higher than 10%.

The fix for me was to use the [Compiz window manager](https://gitlab.com/compiz/compiz-core)
and have the workaround "Fix Screen Updates in XGL with fgrlx." enabled.

## Steps

Specifically for my Debian 12 machine, the steps were:

1. Install the compiz package

    * I used [Synaptic](https://wiki.debian.org/Synaptic),
      but the following terminal command should work

    ```sh
    sudo apt install compiz
    ```

2. Open LXQt settings manager

    ```sh
    lxqt-config-session
    ```

3. In Window manager, select compiz

    ![LXQt Session Settings menu with compiz selected in drop-down menu](/assets/compiz-xgl/compiz-window-manager.png)

4. Log off from your GUI session
5. Log back on to your GUI session

6. Open the CompizConfig Settings manager

    ![Showing launching the CompizConfig settings manager by selecting it from preferences in the application launcher](/assets/compiz-xgl/launcher-compizconfig-settings-manager.png)

7. In the CompizConfig Settings manager, find Utility -> Workarounds

8. Verify the Workarounds are turned on

    ![CompizConfig Settings Manager Workarounds Checked](/assets/compiz-xgl/compizconfig-workarounds-on.png)

9. Click on the Workarounds icon
   (right beside the checkbox that you had to verify or turn on) to expand it

10. Verify "Fix Screen Updates in XGL with fgrlx." is checked

    ![CompizConfig Settings Manager, Workaround Fix Screen Updates in XGL with fgrlx checked](/assets/compiz-xgl/compiz-screen-updates-checked.png)

11. After ticking that checkbox, the setting should apply immediately
    and you should start to notice the render issues are no longer
    there for any new action you perform.

You can close all the windows you may have opened while
doing these steps at this point, with your slightly more workable
virtual machine.

### Other Compiz Items

Compiz is a sign of its age, coming out when
[Windows Vista](https://www.microsoft.com/investor/reports/ar06/staticversion/10k_sl_eng.html)
was coming out to generally negative reactions and
graphical interfaces were trying to outdo each other with animations
and gestures.

While you are in the CompizConfig Settings Manager, you can disable
everything in "Effects" except for Window Decoration (since disabling
Window Decoration removes the title bars from your apps).

Some other usability tweaks you may want are:

* Window Management: Disable Window Rules
  (to avoid the 3D app switcher menu if you jam your cursor to the top right corner of the screen)
* Utility: Error Notifications
  (to see if anything in Compiz has crashed for you)
* Desktop: Enable Expo or Desktop Wall if you use multiple desktops

## References

* <https://wiki.archlinux.org/title/LXQt>
