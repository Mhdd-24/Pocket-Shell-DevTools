function Global:newbranch {
  param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Name,
    [Parameter(Position = 1)]
    [string]$Base,
    [switch]$Push
  )
  $base = if ($Base) { $Base } else { $script:PsDefaultBranch }
  Write-Host "-> fetch + checkout $base + pull + checkout -b $Name" -ForegroundColor DarkCyan
  git fetch origin
  if ($LASTEXITCODE -ne 0) { return }
  git checkout $base
  if ($LASTEXITCODE -ne 0) { return }
  git pull origin $base
  if ($LASTEXITCODE -ne 0) { return }
  git checkout -b $Name
  if ($Push -and $LASTEXITCODE -eq 0) {
    git push -u origin $Name
  }
}

Set-Alias -Name nb -Value newbranch -Scope Global -Force -ErrorAction SilentlyContinue
