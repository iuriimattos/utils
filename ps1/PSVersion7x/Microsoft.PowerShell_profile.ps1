# ===============================
# = START
# ===============================

# https://stackoverflow.com/a/52651577
Set-PSReadLineOption -Colors @{Operator = "Red"; Parameter = "Red"; Command = "Red";String = "Red"}

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
    git clone $args[0]
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
    git checkout $args[0]
}

# GIT alias: checkout and delete branch
function gcob() {
    git branch -D $args[0]
    git checkout -b $args[0]
}

# GIT alias: reset
function greset() {
    git reset $args[0]
}

# GIT alias: reset --hard
function grh() {
    git reset --hard $args[0]
}

# GIT alias: reset --soft
function grs() {
    git reset --soft $args[0]
}

# GIT alias: pulling upstream branch
function gpp() {
    git pull
}

# GIT alias: pulling origin choose branch
function gppo() {
    git pull origin $args[0]
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
    $msg=$args[0]
    if ([string]::IsNullOrEmpty($msg)) {
        $msg = "wip"
    }
    git commit -m "$msg"
    gpush
}

# GIT alias: for git commit wip
function gwip() {
    git add .  
    git commit -m wip
}

# GIT alias: for git commit -m
function gcom() {
    git commit -m $args[0]
}

# ===============================
# = PROMPT
# ===============================

# Custom Posh-Git
Import-Module posh-git
function prompt {
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
    $prompt
}
