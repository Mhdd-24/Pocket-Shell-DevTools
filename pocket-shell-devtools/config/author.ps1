# Banner author line — set in pocket-shell-devtools.local.ps1 or via env / git config.
if (-not $script:PocketShellAuthorName -and $env:POCKET_SHELL_AUTHOR_NAME) {
  $script:PocketShellAuthorName = $env:POCKET_SHELL_AUTHOR_NAME.Trim()
}
if (-not $script:PocketShellAuthorEmail -and $env:POCKET_SHELL_AUTHOR_EMAIL) {
  $script:PocketShellAuthorEmail = $env:POCKET_SHELL_AUTHOR_EMAIL.Trim()
}
if (-not $script:PocketShellAuthorName) {
  $n = git config --global user.name 2>$null
  if ($n) { $script:PocketShellAuthorName = $n.ToString().Trim() }
}
if (-not $script:PocketShellAuthorEmail) {
  $e = git config --global user.email 2>$null
  if ($e) { $script:PocketShellAuthorEmail = $e.ToString().Trim() }
}
