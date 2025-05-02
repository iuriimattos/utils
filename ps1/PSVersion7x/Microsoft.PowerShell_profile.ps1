# ===============================
# = START
# ===============================

# https://stackoverflow.com/a/52651577
Set-PSReadLineOption -Colors @{Operator = "Red"; Parameter = "Red"; Command = "Red";String = "Red"}

function znewtab() {
    wt -w 0 -d $args[0]
}

#cmd /c mklink C:\Users\user\queries.sql C:\Users\user\AppData\Roaming\DBeaverData\workspace6\General\Scripts\Queries.sql
function zmklink() {    
    cmd /c mklink $args[0] $args[1]
}

function zrefreshenv() {
    Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
    refreshenv
}

# https://superuser.com/a/1212364
function cprobo([string]$Source, [string]$Destination) {
    Robocopy.exe $Source $Destination /MIR
}

# https://stackoverflow.com/a/70596319/23516810
function tailf() {
    Get-ChildItem $args | Foreach-Object -Parallel { Get-Content $_ -Tail 1 -Wait }
}

# https://stackoverflow.com/a/43633385
function cppwd() {
    (pwd).Path | CLIP
}

## https://stackoverflow.com/a/69565104
#function rmrf([string]$Path) {
#    try {
#        Remove-Item -Recurse -Force -ErrorAction:Stop $Path
#    } catch [System.Management.Automation.ItemNotFoundException] {
#        # Ignore
#        $Error.Clear()
#    }
#}
function rmrf([string]$Path) {
    try {
        Remove-Item -Recurse -Force -ErrorAction:Stop $Path
    } catch [System.UnauthorizedAccessException] {
        # Attempt to take ownership and set the necessary permissions
        Take-OwnershipAndSetAcl $Path
        Remove-Item -Recurse -Force -ErrorAction:Stop $Path
    } catch [System.Management.Automation.ItemNotFoundException] {
        # Ignore if the item does not exist
        $Error.Clear()
    } catch {
        # Handle any other exceptions
        Write-Error "An error occurred: $_"
    }
}

function Take-OwnershipAndSetAcl([string]$Path) {
    # Take ownership of the item
    takeown /f $Path /r /d y

    # Set full control permission for the current user
    $acl = Get-Acl -Path $Path
    $user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($user, "FullControl", "Allow")
    $acl.SetAccessRule($accessRule)
    Set-Acl -Path $Path -AclObject $acl
}

function lsaa() {
    ls | sort LastWriteTime -Descending | Select -First 50
}

function cplsaa() {
    ls | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty Name | Set-Clipboard
}

function cdlsaa() {
    $latestItem = ls | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($latestItem.PSIsContainer) {
        cd $latestItem.FullName
    } else {
        Write-Host "The latest item is not a directory."
    }
}


function lsa() {
    Get-ChildItem | Sort-Object LastAccessTime -Descending
}

# ===============================
# = SPRING
# ===============================

# Health: https://docs.spring.io/spring-boot/api/rest/actuator/health.html
function springhealth() {
    $argip = $args[0]
    $argport = $args[1]
    curl http://$($argip):$($argport)/actuator/health
}

# ===============================
# = GitHub Copilot in the CLI
# ===============================

function github-copilot-suggest {
    param (
        [string]$description
    )
    gh copilot suggest $description
}

function github-copilot-explain {
    param (
        [string]$command
    )
    gh copilot explain $command
}

# ===============================
# = MAVEN
# ===============================

# Maven: dependency:tree
function mvnm2() {
    mvn dependency:tree
}

# Maven: test class
# not work 
# use 
# mvn -o test -Dtest=JwtUtilTest
function mvntest() {
    Write-Host 
    mvn -o test -Dtest=$args
}

# Maven: Spring Boot RUN
function mvnrun() {
    mvn spring-boot:run
}

# Maven: package
function mvncp() {
    mvn clean package
}

# Maven: install
function mvncifull() {
    mvn clean install
}

# Maven: install skiptest
function mvnci() {
    mvn -o clean install -DskipTests
}

# Maven: update snapshots
function mvnciu() {
    mvn clean install -U
}

# ===============================
# = DOCKER AND WSL
# ===============================

function ddbuild() {
    docker build -t $args .
}

function ddrun() {
    docker run -d -p 5000:5000 $args
}

# https://stackoverflow.com/a/75302399
function ddoff() {
    wsl --unregister docker-desktop
}

# ===============================
# = GIT
# ===============================

# GIT alias cherry-pick --skip
function gck() {
    git cherry-pick --skip
}

# GIT alias: clone
function gclone() {
    git clone $args
}

# GIT alias: log
function gll() {
    git log
}

# GIT alias: stash
function gstash() {
    git stash
}

# GIT alias: stash pop
function gstashpop() {
    git stash pop
}

# todo https://stackoverflow.com/a/58369263
# credits ; https://stackoverflow.com/questions/10018533/is-it-possible-to-git-status-only-modified-files#comment84019862_41382850
# GIT alias: show all modified added, copied, modified and renamed files names
function gdc() {
    git diff --cached --name-only --diff-filter=ACMR
}

# GIT alias: show modified lines not in staged
function gdu() {
    git diff --unified=0
}

# GIT alias: search words inside commits message
function glg() {
    git log --all --grep=$args
}

# GIT alias: search commits by author
function glga() {
    git log --author=$args
}

# GIT alias: status
function gs() {
    git status
}

# GIT alias: fetch
function gf() {
    git fetch --all
}

# GIT alias: git fetch from origin with prune flag
function gfo() {
    git fetch origin --prune
}

# GIT alias: checkout
function gco() {
    git checkout $args && gpp
}

# GIT alias: checkout
function gcob() {
    git checkout -b $args
}

# GIT alias: delete and checkout branch
function gcodb() {
    git branch -D $args
    git checkout -b $args
}

# GIT alias: reset
function greset() {
    git fetch --all && git reset $args
}

# GIT alias: reset --hard origin/master
function grhmaster() {
    git fetch --all && git reset --hard origin/master
}

# GIT alias: reset --hard
function grh() {
    git fetch --all && git reset --hard $args
}

# GIT alias: reset --soft
function grs() {
    git fetch --all && git reset --soft $args
}

# GIT alias: rebase to arg branch
function grebase() {
    git fetch --all && git rebase origin/$args
}

# GIT alias: merge ours
function gmergeours() {
    git fetch --all && git merge -Xours origin/$args
}

# GIT alias: pulling upstream branch
function gpp() {
    git pull
}

# To perform a `git pull` with a specific merge strategy, such as `-Xtheirs`, you can use the `git pull` command with the `--strategy` and `--strategy-option` flags. Here's how you can do it:
function pull-rebase-theirs() {
  git pull --rebase --strategy=recursive --strategy-option=theirs origin develop  
}

# GIT alias: pulling origin choose branch
function gppo() {
    git pull origin $args
}

# GIT alias: publish local branch to remote
function gpush() {
    git push origin --set-upstream $(git rev-parse --abbrev-ref HEAD)
}

# GIT alias: publish local branch to remote
function gpushf() {
    git push origin --set-upstream $(git rev-parse --abbrev-ref HEAD) -f
}

# GIT alias: update a branch then switch back to the current branch
function gup() {
    $c=$(git rev-parse --abbrev-ref HEAD)
    git checkout "$1"
    git pull
    git checkout "$c"
}

# GIT alias: quick command to add your code and check stage and unstage changes
function gadd() {
    git add $args
    gs
}

# GIT alias: quick command to help your code and push to remote
function gsave() {
    git add .
    $msg=$args
    if ([string]::IsNullOrEmpty($msg)) {
        $msg = "Work In Progress"
    }
    git commit -m "$msg"
    gpush
}

# GIT alias: for git commit wip
function gwip() {
    $msg = "Work In Progress"    
    git add .  
    git commit -m "$msg" --no-verify
}

# GIT alias: for git commit -m
function gcom() {
    git status
    git commit -m $args
}

# GIT alias: git push origin
function gcompush() {
    gadd . && gcom $args && gpushf
}

# GIT alias: git push origin
function gwipush() {
    gcodb work_in_progress && git add . && gcom work_in_progress && grebase master && gpush
}

# ===============================
# = PYTHON
# ===============================

<#
.SYNOPSIS
Displays detailed information about a Python package installed via pip.

.DESCRIPTION
The `ppshow` function uses the `pip show` command to display metadata about a specified Python package. 
This includes details such as the package name, version, location, dependencies, and more.

.PARAMETER args
The name of the Python package for which information is to be displayed. 
This parameter is passed directly to the `pip show` command.

.EXAMPLE
ppshow numpy
This command will display detailed information about the `numpy` package.

.NOTES
- Ensure that Python and pip are installed and available in the system's PATH.
- The function uses the `python -m pip show` command internally.
#>
function ppshow() {
    python -m pip show $args    
}

# ===============================
# = PROMPT
# ===============================

# Custom Posh-Git
Import-Module posh-git
function prompt {
    Write-Host 
    $origLastExitCode = $LASTEXITCODE
    $parentFullPath = Split-Path -path (Get-Location)
    $parentFolderName = Split-Path -leaf -path $($parentFullPath)
    $currentFolderName = Split-Path -leaf -path (Get-Location)
    Write-Host "$($parentFolderName)\$($currentFolderName)"
    if ($status = Get-GitStatus -Force) {
        $prompt += "$(Write-GitBranchStatus $status -NoLeadingSpace)$(Write-GitBranchName $status)"
    }
    $prompt += "$(if ($PsDebugContext) {' [DBG]:'} else {''})$('>' * ($nestedPromptLevel + 1)) "
    $LASTEXITCODE = $origLastExitCode
    Write-Host $prompt   
}
