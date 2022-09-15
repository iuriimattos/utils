# PSVersion                      5.1.18362.145
# PSEdition                      Desktop
# PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
# BuildVersion                   10.0.18362.145
# CLRVersion                     4.0.30319.42000
# WSManStackVersion              3.0
# PSRemotingProtocolVersion      2.3
#SerializationVersion           1.1.0.1

# https://stackoverflow.com/a/52651577
Set-PSReadLineOption -Colors @{Operator = "Red"; Parameter = "Red"; Command = "Red";String = "Red"}

Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme  ~/mypwsh10k.omp.json

function Get-GitLog { & git log --graph --oneline --decorate $args }
New-Alias -Name gl -Value Get-GitLog -Force -Option AllScope

function Get-GitTree { & git log --graph --oneline --decorate $args }
New-Alias -Name gt -Value Get-GitTree -Force -Option AllScope

function Get-GitStatus { & git status -sb $args }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope

function Get-GitCommit { & git commit -ev $args }
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope

function Get-GitAdd { & git add $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope

function Get-AddAll { & git add . }
New-Alias -Name gaa -Value Get-AddAll -Force -Option AllScope

function Get-GitCommitWip { & Get-AddAll AND git commit -m wip }
New-Alias -Name gwip -Value Get-GitCommit -Force -Option AllScope

function Get-GitCommitWipPush { & Get-GitCommitWip AND git push }
New-Alias -Name gsave -Value Get-GitCommitWipPush -Force -Option AllScope

function Get-GitFetch { & git fetch $args }
New-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope

function Get-GitBranch { & git branch $args }
New-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope

function Get-GitBranchDelete { & git branch -D $args }
New-Alias -Name gbdel -Value Get-GitBranchDelete -Force -Option AllScope

function Get-GitRemote { & git remote -v $args }
New-Alias -Name gr -Value Get-GitRemote -Force -Option AllScope

function Get-GitAdd { & git add --all $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope

function Get-GitPush { & git push $args }
New-Alias -Name gpp -Value Get-GitPush -Force -Option AllScope

function Get-GitPull { & git pull $args }
New-Alias -Name gp -Value Get-GitPull -Force -Option AllScope

function Get-GitCheckout { & git checkout $args }
New-Alias -Name gco -Value Get-GitCheckout -Force -Option AllScope

function Get-GitResetHard { & git reset --hard $args }
New-Alias -Name grh -Value Get-GitResetHard -Force -Option AllScope

function Get-GitResetSoft { & git reset --soft $args }
New-Alias -Name grs -Value Get-GitResetSoft -Force -Option AllScope

function Run-CleanInstall { & mvn clean install -DskipTests }
New-Alias -Name mvnci -Value Run-CleanInstall -Force -Option AllScope

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
