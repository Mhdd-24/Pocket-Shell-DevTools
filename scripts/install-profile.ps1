# Appends Pocket Shell DevTools to the current user's PowerShell profile (idempotent).
param(
  [string]$LoaderPath = (Resolve-Path (Join-Path $PSScriptRoot '..\pocket-shell-devtools.ps1')).Path
)

$marker = '# Pocket Shell DevTools'
$line = ". '$LoaderPath'  $marker"

$profilePath = $PROFILE
$dir = Split-Path $profilePath -Parent
if (-not (Test-Path $dir)) {
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

$workspacePattern = "workspace-devtools\.ps1"

if (Test-Path $profilePath) {
  $lines = Get-Content $profilePath | Where-Object {
    $_ -notmatch $workspacePattern -and $_ -notmatch 'Workspace DevTools'
  }
  if ($lines -match [regex]::Escape($marker)) {
    Set-Content -Path $profilePath -Value ($lines -join "`n")
    Write-Host "Removed Workspace DevTools; Pocket Shell already in profile: $profilePath"
    return
  }
  $lines += $line
  Set-Content -Path $profilePath -Value ($lines -join "`n")
}
else {
  Set-Content -Path $profilePath -Value $line
}

Write-Host "Added to profile: $profilePath"
Write-Host 'Open a new PowerShell window or run: reload'
