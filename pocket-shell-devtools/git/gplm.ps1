function Global:gplm {
  $base = $script:PsDefaultBranch
  Write-Host "-> git fetch origin $base; git pull origin $base --no-ff" -ForegroundColor DarkCyan
  git fetch origin $base
  if ($LASTEXITCODE -ne 0) { return }
  git pull origin $base --no-ff
}
