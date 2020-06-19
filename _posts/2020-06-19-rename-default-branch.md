---
layout: post
title:  "Renamining the default branch in Git"
date:   2020-06-19 00:01
categories: tips
---

I like the idea of [renaming the Git "master"](https://www.bbc.com/news/technology-53050955) default
branch. 
In my personal project repositories, none of the definitions of the word "master" make sense for what I do with the
branch.

Just in case you want to do the same before your repository server has an option to do it for you, here are the steps.
In this case, I'm renaming `master` to `main`.

1.  Browse to your local copy of the repository to start, and make sure you don't have any local changes.
    Local changes are any files you modified, added, or deleted without having sent the changes to the remote yet.
    (You usually have local changes if you are working on stuff in that repository at the time.)

    [Commit](https://git-scm.com/docs/git-commit), [stash](https://git-scm.com/docs/git-stash),
    [reset](https://git-scm.com/docs/git-reset) or delete the local changes depending on how
    much you want to keep the local changes.

1.  Now that the local changes are out of the way, sync up to the remote copy of the `master` branch you are renaming.
    ```
    git checkout master
    git pull
    ```

1.  Create the branch with the new name. In this case, `main`,
    ```
    git branch main
    git push --set-upstream origin main
    ```

1.  Verify all your tooling can use that `main` branch or is aware of the default Git branch without using its name 
    before continuing. Tools you may need to reconfigure are:

    * [Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
    * [Continuous integration builds](https://www.atlassian.com/continuous-delivery/continuous-integration)

1. Change the default branch on the server side. This is different depening on the repository.
    * [Github](https://help.github.com/en/github/administering-a-repository/setting-the-default-branch)
    * [Gitlab](https://docs.gitlab.com/ee/user/project/repository/branches/#default-branch)
    * [Bitbucket](https://community.atlassian.com/t5/Bitbucket-questions/How-to-change-MAIN-branch-in-BitBucket/qaq-p/977418)

1. Finally, delete the old default branch on the server side:

    ```
    git push --delete origin master
    ```

1.  View the repository in the server's web interface or [clone](https://git-scm.com/docs/git-clone)
    a new copy from the server.
    You should no longer see the old default branch.
