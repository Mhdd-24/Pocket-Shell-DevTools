function Global:nodev {
  if (Get-Command node -ErrorAction SilentlyContinue) {
    Write-Host ("node  {0}" -f (node -v))
  } else { Write-Host 'node not found on PATH' -ForegroundColor Red }
  if (Get-Command npm -ErrorAction SilentlyContinue) {
    Write-Host ("npm   {0}" -f (npm -v))
  } else { Write-Host 'npm not found on PATH' -ForegroundColor Red }
}
