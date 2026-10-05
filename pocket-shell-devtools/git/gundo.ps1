function Global:gundo {
  Write-Host '-> git reset --soft HEAD~1' -ForegroundColor DarkCyan
  git reset --soft HEAD~1
}
