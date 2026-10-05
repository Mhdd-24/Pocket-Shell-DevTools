# Code home and defaults for Pocket Shell DevTools (personal / laptop).
# Override in pocket-shell-devtools.local.ps1 or via environment variables.

if ($env:POCKET_SHELL_CODE_HOME) {
  $script:CODE_HOME = $env:POCKET_SHELL_CODE_HOME
}
elseif (Test-Path (Join-Path $HOME 'Github')) {
  $script:CODE_HOME = (Resolve-Path (Join-Path $HOME 'Github')).Path
}
elseif (Test-Path (Join-Path $HOME 'code')) {
  $script:CODE_HOME = Join-Path $HOME 'code'
}
else {
  $script:CODE_HOME = $HOME
}

# Back-compat name used by repo navigation helpers.
$script:CODEBASE = $script:CODE_HOME

if ($env:POCKET_SHELL_DEFAULT_BRANCH) {
  $script:PsDefaultBranch = $env:POCKET_SHELL_DEFAULT_BRANCH
}
else {
  $script:PsDefaultBranch = 'main'
}

$CODE_HOME = $script:CODE_HOME
$CODEBASE  = $script:CODE_HOME
