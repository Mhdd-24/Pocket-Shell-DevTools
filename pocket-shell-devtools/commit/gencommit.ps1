function gencommit {
  param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Rest
  )
  if (-not $Rest -or $Rest.Count -eq 0) {
    Invoke-GenCommitMsg -ListRepos
    return
  }
  if ($Rest -contains '-ListRepos') {
    Invoke-GenCommitMsg -ListRepos
    return
  }
  $kind = $Rest[0]
  $id = if ($Rest.Count -gt 1) { $Rest[1] } else { '' }
  $alias = if ($Rest.Count -gt 2) { $Rest[2] } else { '' }
  $comment = if ($Rest.Count -gt 3) { ($Rest[3..($Rest.Count - 1)] -join ' ') } else { '' }
  Invoke-GenCommitMsg -Kind $kind -WorkItemId $id -RepoAlias $alias -Comment $comment
}
