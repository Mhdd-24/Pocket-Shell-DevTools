function Global:psgit {
  param(
    [Parameter(Mandatory = $true, Position = 0)][string]$RepoAlias,
    [Parameter(ValueFromRemainingArguments = $true)][string[]]$Rest
  )
  $key = $RepoAlias.Trim().ToLowerInvariant()
  if (-not $script:RepoMap.Contains($key)) {
    Write-Host "Unknown repo alias '$RepoAlias'. Known: $($script:RepoMap.Keys -join ', ')" -ForegroundColor Red
    return
  }
  Invoke-PsRepoGit -RepoFolder $script:RepoMap[$key] @Rest
}
