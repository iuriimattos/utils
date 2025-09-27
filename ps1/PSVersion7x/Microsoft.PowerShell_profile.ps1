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

function zversion() {
    $PSversionTable
}

# Chocolatey
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

<#
.SYNOPSIS
Lists directories recursively while excluding specific directories.

.DESCRIPTION
The `Get-IndentedDirectories` function recursively lists all directories in the current path, excluding directories that match a specified pattern (e.g., "node_modules").
The output displays the directory names indented based on their depth in the directory structure.

.PARAMETER ExcludePattern
A string pattern to exclude directories from the output. Defaults to "node_modules".

.EXAMPLE
Get-IndentedDirectories
This command will list all directories, excluding "node_modules", with indentation based on their depth.

.EXAMPLE
Get-IndentedDirectories -ExcludePattern "bin"
This command will list all directories, excluding "bin", with indentation based on their depth.

.NOTES
- The function uses `Get-ChildItem` to retrieve directories and `Where-Object` to filter them.
- Indentation is calculated based on the depth of the directory in the structure.
#>
function Get-IndentedDirectories {
    param (
        [string]$ExcludePattern = "node_modules"
    )

    Get-ChildItem -Recurse -Directory | Where-Object { $_.FullName -notmatch $ExcludePattern } | ForEach-Object {
        $depth = $_.FullName.Split("\").Count
        (" " * ($depth * 2)) + $_.Name
    }
}


<#
.SYNOPSIS
Creates nested directories step-by-step starting from the current directory when a leading single backslash is used,
or creates absolute/relative directories normally.

.DESCRIPTION
New-MkDirsFromCwd accepts one or more path strings and ensures each path segment exists.
- If a path starts with a single leading backslash (for example: "\storage\downloads\Sync"), it is treated as relative
  to the current directory (so it creates .\storage, .\storage\downloads, etc).
- Drive-rooted paths (C:\...) and UNC paths (\\server\share\...) are honored as absolute.
- Supports '.' and '..' segments.
- Supports -WhatIf and -Confirm via ShouldProcess.

.PARAMETER Path
One or more path strings to create. Paths may be relative, begin with a single leading backslash
to indicate "from current directory", or be absolute (drive root or UNC).

.EXAMPLE
# Dot-source then create a folder chain relative to current directory:
. .\mkdirs.ps1
New-MkDirsFromCwd '\storage\downloads\Sync'

.EXAMPLE
# Create multiple paths at once:
New-MkDirsFromCwd 'logs\2025\09' '\storage\downloads\Sync'

.EXAMPLE
# Dry run (no changes) to see what would be created:
New-MkDirsFromCwd '\storage\downloads\Sync' -WhatIf

.NOTES
Author: Generated snippet
Date: 2025-09-27
This function prints "Created: <fullpath>" for each directory it creates and "Exists: <fullpath>" for existing ones.
#>
function New-MkDirsFromCwd {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [string[]] $Path
    )

    process {
        foreach ($orig in $Path) {
            if ([string]::IsNullOrWhiteSpace($orig)) { continue }

            # Determine base and remaining path
            if ($orig -match '^[\\/]{2}') {
                # UNC absolute (\\server\share\...)
                $base = [System.IO.Path]::GetPathRoot($orig)
                $rest = $orig.Substring($base.Length).TrimStart('\','/')
            }
            elseif ($orig.StartsWith('\') -or $orig.StartsWith('/')) {
                # Leading single slash: treat as relative to current directory
                $base = (Get-Location).ProviderPath
                $rest = $orig.TrimStart('\','/')
            }
            elseif ([System.IO.Path]::IsPathRooted($orig)) {
                # Drive-rooted absolute path (C:\...)
                $base = [System.IO.Path]::GetPathRoot($orig)
                $rest = $orig.Substring($base.Length).TrimStart('\','/')
            }
            else {
                # Relative path from current directory
                $base = (Get-Location).ProviderPath
                $rest = $orig
            }

            if ([string]::IsNullOrEmpty($rest)) {
                # Nothing to create beyond the root/base
                if (-not (Test-Path -Path $base -PathType Container)) {
                    if ($PSCmdlet.ShouldProcess($base, "Create directory")) {
                        New-Item -Path $base -ItemType Directory -Force | Out-Null
                        Write-Output "Created: $base"
                    }
                }
                else {
                    Write-Output "Exists: $base"
                }
                continue
            }

            $segments = $rest -split '[\\/]+'
            foreach ($seg in $segments) {
                if ($seg -in @('', '.')) { continue }
                if ($seg -eq '..') {
                    $parent = Split-Path -Path $base -Parent
                    if ($parent) { $base = $parent }
                    continue
                }
                $base = Join-Path $base $seg
                if (-not (Test-Path -Path $base -PathType Container)) {
                    if ($PSCmdlet.ShouldProcess($base, "Create directory")) {
                        New-Item -Path $base -ItemType Directory -Force | Out-Null
                        Write-Output "Created: $base"
                    }
                }
                else {
                    Write-Output "Exists: $base"
                }
            }
        }
    }
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

# GIT alias: fetch
function gftag() {
    git fetch --all --tags
}

# GIT alias: git fetch from origin with prune flag
function gfo() {
    git fetch origin --prune
}

# GIT alias: checkout
function gco() {
    git checkout $args
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

<#
.SYNOPSIS
Installs a Python package using pip.

.DESCRIPTION
The `ppinstall` function uses the `pip install` command to install a specified Python package.
This function allows you to install Python packages directly from the command line.

.PARAMETER args
The name of the Python package to be installed.
This parameter is passed directly to the `pip install` command.

.EXAMPLE
ppinstall numpy
This command will install the `numpy` package.

.NOTES
- Ensure that Python and pip are installed and available in the system's PATH.
- The function uses the `py -m pip install` command internally.
#>
function ppinstall() {
    py -m pip install $args
}

<#
.SYNOPSIS
Upgrades pip to the latest version.

.DESCRIPTION
The `upgrade-pip` function uses the specified Python executable to upgrade pip to the latest version.
This function allows you to run the pip upgrade command directly from the command line.

.PARAMETER pythonPath
The path to the Python executable to be used for upgrading pip.

.EXAMPLE
upgrade-pip "C:\Python39\python.exe"
This command will upgrade pip using the Python executable located at `C:\Python39\python.exe`.

.NOTES
- Ensure that the specified Python executable exists and is accessible.
- The function uses the `-m pip install --upgrade pip` command internally.
#>
function ppupgrade() {
    py -m pip install --upgrade pip
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

# Scoop fix error:
# The SSL connection could not be established, see inner exception.
[Net.ServicePointManager]::SecurityProtocol = "tls, tls11, tls12, tls13, SystemDefault"