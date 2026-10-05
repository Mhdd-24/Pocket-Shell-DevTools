function Global:ngv {
  if (Get-Command ng -ErrorAction SilentlyContinue) { ng version }
  else { Write-Host 'Angular CLI (ng) not found on PATH' -ForegroundColor Red }
}
