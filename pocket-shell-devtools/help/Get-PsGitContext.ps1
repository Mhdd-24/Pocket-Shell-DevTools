function Get-PsGitContext {
  $cwd = (Get-Location).Path
  $gitRoot = git rev-parse --show-toplevel 2>$null
  if ($LASTEXITCODE -ne 0 -or -not $gitRoot) {
    return [pscustomobject]@{
      InGit      = $false
      Cwd        = $cwd
      GitRoot    = $null
      RepoFolder = $null
      RepoAlias  = $null
      Branch     = $null
      Tracking   = $null
      Dirty      = $false
    }
  }

  $gitRoot = $gitRoot.ToString().Trim()
  $branch = (git branch --show-current 2>$null)
  if ($branch) { $branch = $branch.ToString().Trim() }
  $tracking = (git status -sb 2>$null | Select-Object -First 1)
  if ($tracking) { $tracking = $tracking.ToString().Trim() }
  $dirty = [bool](git status --porcelain 2>$null)

  $folder = Split-Path $gitRoot -Leaf
  $aliases = [System.Collections.Generic.List[string]]::new()
  foreach ($key in $script:RepoMap.Keys) {
    if ($script:RepoMap[$key] -eq $folder -and -not $aliases.Contains($key)) {
      $aliases.Add($key)
    }
  }
  $aliasText = if ($aliases.Count -gt 0) { ($aliases | Sort-Object) -join ', ' } else { '(no alias — see gencommit -ListRepos)' }

  [pscustomobject]@{
    InGit      = $true
    Cwd        = $cwd
    GitRoot    = $gitRoot
    RepoFolder = $folder
    RepoAlias  = $aliasText
    Branch     = if ($branch) { $branch } else { '(detached HEAD)' }
    Tracking   = $tracking
    Dirty      = $dirty
  }
}
