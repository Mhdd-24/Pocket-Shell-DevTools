function Show-PsRepoHelp {
  Write-Host ''
  Write-Host 'Usage:  f|b <id> <repo> [comment]   OR   gencommit <f|b> <id> <repo> [comment]' -ForegroundColor Cyan
  Write-Host '  f = Feat   b = Bug'
  Write-Host ''
  Write-Host 'Examples:' -ForegroundColor Cyan
  Write-Host '  f 88482 sublime'
  Write-Host '  b 83423 pocket'
  Write-Host '  f 88482 sublime "Add MCP status tool"'
  Write-Host '  gencommit -ListRepos'
  Write-Host ''
  Write-Host 'Repo aliases:' -ForegroundColor Cyan
  foreach ($key in $script:RepoMap.Keys) {
    Write-Host ('  {0,-14} -> {1}' -f $key, $script:RepoMap[$key])
  }
  Write-Host ''
}
