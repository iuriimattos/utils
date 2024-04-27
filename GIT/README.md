[Git Extensions is a standalone UI tool for managing git repositories. It also integrates with Windows Explorer and Microsoft Visual Studio (2015/2017/2019)](https://github.com/gitextensions/gitextensions)

```bash
branch
```

> Version of the code, usually used when the software is in development. Branches are primarily used when multiple people are working on the same project. It is generally used to reference some change in the main code such as a BUGFIX, HOTFIX, FEATURE, or RELEASE.

```bash
HEAD
```

> Indicates the last commit.

```bash
git init
```

> Initializes a git project.

```bash
git add .
```

> Prepares modifications (staged) for versioning.

```bash
git remote show remote
```

> Shows all the information of a remote repository.

```bash
git remote -v
```

> Displays how many remote repositories are configured.

```bash
git status
```

> Displays the current state of the branch.

```bash
git checkout (file)
```

> Reverts the file to its original state.

```bash
git checkout (branch)
```

> Sends the current changes to a branch.

```bash
git checkout -b (branch)
```

> Creates a branch with the current modifications.

```bash
git checkout -b remote/branch branchName
```

> Creates a new branch from a remote repository.

```bash
git commit -m "commit message"
```

> Creates a new version.

```bash
git push
```

> Updates the current branch or a pre-configured one from the remote repository.

```bash
git push --set-upstream <remote> <branch>
```

> Pre-configures the current branch for a branch from the remote repository.

```bash
git push remote branch
```

> Updates a specific branch of the remote repository.

```bash
git push remote branch -f
```

> Forces the update of a branch from the remote repository.

```bash
git rebase --abort
```

> Aborts the rebase.

```bash
git fetch origin && git rebase remote/branch
```

> Updates the current branch from a remote repository (places the current commits on top (HEAD)).
> Ideal for working on the same file.

```bash
git pull remote branch --rebase
```

> Updates the current branch from a remote repository (places the current commits on top (HEAD)).
> Ideal for working on the same file.

```bash
git pull rebase --continue
```

> Continues the pull --rebase after resolving conflicts.

```bash
git remote add origin (url)
```

> Adds a remote repository to the local repository.

```bash
git clone (url)
```

> Clones a project.

```bash
ignoring all files in a folder
```

> 
        *
        */
        !.gitignore

```bash
git checkout (file)
```

> Removes uncommitted changes from a file.

```bash
git fetch -p
```

> Removes deleted branches on remote.

```bash
git fetch --all
```

```bash
git fetch -a
```

> Fetches changes from all remote branches.

```bash
git log
```

> Displays the modifications of the current branch with their respective hashes.
> The hash is a sequence of numbers and letters following the word commit.

```bash
git log --all --grep='Overwrite remote'
```

> Filters modifications by commit message.

```bash
git reset .
```

> Removes all modifications that would be committed (unstage).
> Used to revert the git add (different from git checkout .).

```bash
git reset --soft <commit_hash>
```

> Resets the current branch to a specific commit
> **and places the modifications from HEAD up to <commit_hash> in your working tree for a commit**
> Modifications remain staged (git add causes staging).

```bash
git reset --soft HEAD~<number>
```

> Resets <number> commits from the current branch
> **and places the modifications from HEAD up to <number> in your working tree for a commit**.


```bash
git reset --hard commit
```

```bash
git reset --hard HEAD~<number>
```

```bash
git reset --hard remote/branch
```

> Resets the current branch to a specific commit **NOT keeping uncommitted changes**.

```bash
git rm --cached -r <path-to-file>
git rm --cached -r <path>
```

> Deletes all versions of a particular file or folder.

```bash
git cherry-pick --no-commit <commit_hash>, <commit_hash>
```

> Picks commits and updates the working tree, leaving these changes in staged.

```bash
git merge [branch] --strategy-option ours
git merge [branch] -x ours
git merge -Xours [remote]/[branch]
git merge [branch] --strategy-option theirs
git merge [branch] -x theirs
git merge -Xtheirs [remote]/[branch]
```

> Merges the current branch with [branch], which can be origin/yourbranchname.

```bash
‐‐diff-algorithm={myers|default}
```

> Myers: The original algorithm as implemented in [xdiff-lib.html](http://www.xmailserver.org/xdiff-lib.html) and [diff2.pdf](http://www.xmailserver.org/diff2.pdf), optimizing the 'edit distance' for changed lines.

```bash
‐‐diff-algorithm=minimal
```

> Minimal: Myers plus trying to minimize the patch size. It takes more time to process, as it seeks the optimal solution of smaller difference, useful for turf files.

```bash
‐‐diff-algorithm=patience
```

> Patience: Attempts to trade readability of the patch versus patch size and processing time. See What is `git diff --patience` for? and [bramcohen livejournal](http://bramcohen.livejournal.com/73318.html) or [alfedenzo livejournal](http://alfedenzo.livejournal.com/170301.html) for a description.

```bash
‐‐diff-algorithm=histogram
```

> Histogram: Mainly created for speed. Faster than Myers and Patience, originally developed in [jgit](http://eclipse.org/jgit/)
