function Global:reload {
  Remove-Variable PocketShellDevToolsLoaded -Scope Global -ErrorAction SilentlyContinue
  . (Join-Path $script:PocketShellDevToolsRoot 'pocket-shell-devtools.ps1')
}
