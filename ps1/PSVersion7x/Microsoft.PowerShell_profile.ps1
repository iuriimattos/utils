# ===============================
# = START
# ===============================

# https://stackoverflow.com/a/52651577
Set-PSReadLineOption -Colors @{Operator = "Red"; Parameter = "Red"; Command = "Red";String = "Red"}

# https://superuser.com/a/1212364
function cprobo([string]$Source, [string]$Destination) {
    Robocopy.exe $Source $Destination /MIR
}

# https://stackoverflow.com/a/43633385
function cppwd() {
    (pwd).Path | CLIP
}

# https://stackoverflow.com/a/69565104
function rmrf([string]$Path) {
    try {
        Remove-Item -Recurse -ErrorAction:Stop $Path
    } catch [System.Management.Automation.ItemNotFoundException] {
        # Ignore
        $Error.Clear()
    }
}

function lsaa() {
    ls | sort LastWriteTime -Descending | Select -First 5
}

function lsa() {
    Get-ChildItem | Sort-Object LastAccessTime -Descending
}

# ===============================
# = MAVEN
# ===============================


# Maven: package
function mvncp() {
    mvn clean package
}

# Maven: install
function mvnci() {
    mvn clean install -DskipTests
}

# Maven: update snapshots
function mvnciu() {
    mvn clean install -DskipTests -U
}

# ===============================
# = GIT
# ===============================

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

# GIT alias: show modified lines of not staged
function gdu() {
    git diff --unified=0
}

# GIT alias: search words inside commits message
function glg() {
    git log --all --grep='$args'
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
    git checkout $args
}

# GIT alias: checkout and delete branch
function gcob() {
    git branch -D $args
    git checkout -b $args
}

# GIT alias: reset
function greset() {
    git reset $args
}

# GIT alias: reset --hard
function grh() {
    git reset --hard $args
}

# GIT alias: reset --soft
function grs() {
    git reset --soft $args
}

# GIT alias: rebase to arg branch
function grebase() {
    git fetch origin && git rebase origin/$args
}

# GIT alias: pulling upstream branch
function gpp() {
    git pull
}

# GIT alias: pulling origin choose branch
function gppo() {
    git pull origin $args
}

# GIT alias: publish local branch to remote
function gpush() {
    git push origin --set-upstream $(git rev-parse --abbrev-ref HEAD)
}

# GIT alias: update a branch then switch back to the current branch
function gup() {
    $c=$(git rev-parse --abbrev-ref HEAD)
    git checkout "$1"
    git pull
    git checkout "$c"
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
    git add .
    git commit -m $args
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
