function Global:Invoke-PsRepoGit {
  param(
    [Parameter(Mandatory = $true)][string]$RepoFolder,
    [Parameter(ValueFromRemainingArguments = $true)][string[]]$Rest
  )
  if (-not (Go-PsCodeRepo $RepoFolder)) { return }
  if ($Rest -and $Rest.Count -gt 0) { Invoke-PsGitShortcut @Rest }
}
