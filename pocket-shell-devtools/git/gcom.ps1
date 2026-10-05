function Global:gcom {
  $base = $script:PsDefaultBranch
  Write-Host "-> git checkout $base" -ForegroundColor DarkCyan
  git checkout $base
}
