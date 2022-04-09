# https://stackoverflow.com/a/52651577
Set-PSReadLineOption -Colors @{Operator = "Blue"; Parameter = "Blue"; Command = "Blue";String = "Blue"}
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
    git checkout "$1"
}
# GIT alias: branch delete (TODO)
function gbdel() {
    git branch -D "$1"
}
# GIT alias: publish local branch to remote
function gpo() {
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
    gpo
}
# GIT alias: for git commit wip
function gwip() {
    git commit -m wip
}
# GIT alias: for git commit -m
function gcom() {
    git commit -m $args[0]
}
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