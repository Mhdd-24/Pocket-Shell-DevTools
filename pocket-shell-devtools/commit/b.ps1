function b {
  param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$WorkItemId,
    [Parameter(Mandatory = $true, Position = 1)]
    [string]$RepoAlias,
    [Parameter(Position = 2)]
    [string]$Comment = ''
  )
  Invoke-GenCommitMsg -Kind b -WorkItemId $WorkItemId -RepoAlias $RepoAlias -Comment $Comment
}
