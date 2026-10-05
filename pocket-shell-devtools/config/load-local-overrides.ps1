# Optional local overrides (gitignored): pocket-shell-devtools.local.ps1
# Copy from: pocket-shell-devtools.local.ps1.example
$local = Join-Path $script:PocketShellDevToolsRoot 'pocket-shell-devtools.local.ps1'
if (Test-Path -LiteralPath $local) {
  . $local
}
