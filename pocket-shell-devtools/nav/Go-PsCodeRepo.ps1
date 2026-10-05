function Global:Go-PsCodeRepo {
  param([Parameter(Mandatory = $true)][string]$RepoFolder)
  $path = Join-Path $script:CODEBASE $RepoFolder
  if (-not (Test-Path $path)) {
    Write-Host "Repo not found: $path" -ForegroundColor Red
    return $false
  }
  Set-Location $path
  return $true
}
