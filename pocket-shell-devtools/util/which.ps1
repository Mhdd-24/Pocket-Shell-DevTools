function Global:which {
  param([Parameter(Mandatory = $true, Position = 0)][string]$Name)
  $cmd = Get-Command $Name -ErrorAction SilentlyContinue
  if (-not $cmd) {
    Write-Host "Not found: $Name" -ForegroundColor Yellow
    return
  }
  if ($cmd.Source) { $cmd.Source }
  elseif ($cmd.Path) { $cmd.Path }
  else { $cmd.Definition }
}
