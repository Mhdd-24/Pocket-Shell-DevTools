function Invoke-GenCommitMsg {
  param(
    [Parameter(Position = 0)]
    [string]$Kind,

    [Parameter(Position = 1)]
    [string]$WorkItemId,

    [Parameter(Position = 2)]
    [string]$RepoAlias,

    [Parameter(Position = 3)]
    [string]$Comment = '',

    [switch]$ListRepos
  )

  $ErrorActionPreference = 'Stop'
  $WorkspaceRoot = $script:CODEBASE
  $RepoMap = $script:RepoMap

  if ($ListRepos -or -not $Kind) {
    Show-PsRepoHelp
    if (-not $Kind) { return }
  }

  $kindNorm = $Kind.Trim().ToLowerInvariant()
  switch ($kindNorm) {
    { $_ -in @('f', 'feat', 'feature') } { $Type = 'Feat'; break }
    { $_ -in @('b', 'bug', 'fix') }      { $Type = 'Bug'; break }
    default {
      Write-Host "Unknown kind '$Kind'. Use f (Feat) or b (Bug)." -ForegroundColor Red
      Show-PsRepoHelp
      return
    }
  }

  if ($WorkItemId -notmatch '^\d+$') {
    Write-Host "Work item id must be digits only (e.g. 88482). Got: $WorkItemId" -ForegroundColor Red
    return
  }

  if (-not $RepoAlias) {
    Write-Host 'Repo alias required (e.g. gateway).' -ForegroundColor Red
    Show-PsRepoHelp
    return
  }

  $aliasKey = $RepoAlias.Trim().ToLowerInvariant()
  if (-not $RepoMap.Contains($aliasKey)) {
    $candidate = Join-Path $WorkspaceRoot $RepoAlias
    if (Test-Path (Join-Path $candidate '.git')) {
      $repoFolder = $RepoAlias
    }
    else {
      Write-Host "Unknown repo alias '$RepoAlias'." -ForegroundColor Red
      Show-PsRepoHelp
      return
    }
  }
  else {
    $repoFolder = $RepoMap[$aliasKey]
  }

  $repoPath = Join-Path $WorkspaceRoot $repoFolder
  if (-not (Test-Path (Join-Path $repoPath '.git'))) {
    Write-Host "Not a git repo: $repoPath" -ForegroundColor Red
    return
  }

  Push-Location $repoPath
  try {
    $stagedStat = git diff --cached --stat 2>$null
    $stagedFiles = @(git diff --cached --name-only 2>$null)

    if (-not $stagedFiles -or $stagedFiles.Count -eq 0) {
      Write-Host "No staged files in $repoFolder. Stage changes first, then re-run." -ForegroundColor Yellow
      return
    }

    if (-not $Comment) {
      $firstFile = $stagedFiles | Select-Object -First 1
      $name = if ($firstFile) { Split-Path $firstFile -Leaf } else { 'changes' }
      if ($stagedFiles.Count -gt 1) {
        $Comment = "Update $($stagedFiles.Count) files ($name and related)"
      }
      else {
        $Comment = "Update $name"
      }
    }

    $msg = "$Type ($WorkItemId): $Comment"

    Write-Host ''
    Write-Host "Repo:    $repoFolder" -ForegroundColor Cyan
    Write-Host "Path:    $repoPath"
    Write-Host "Type:    $Type"
    Write-Host "WorkItem:$WorkItemId"
    Write-Host ''
    Write-Host 'Staged:' -ForegroundColor Cyan
    Write-Host $stagedStat
    Write-Host ''
    Write-Host 'Commit message (copied to clipboard):' -ForegroundColor Green
    Write-Host $msg
    Write-Host ''
    Write-Host 'Paste into Source Control, then click Commit. Do NOT use the Generate sparkle.' -ForegroundColor Yellow

    try {
      Set-Clipboard -Value $msg
    }
    catch {
      Write-Host '(Clipboard copy failed - copy the line above manually.)' -ForegroundColor DarkYellow
    }
  }
  finally {
    Pop-Location
  }
}
