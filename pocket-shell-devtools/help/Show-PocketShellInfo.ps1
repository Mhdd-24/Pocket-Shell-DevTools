function Show-PocketShellInfo {
  param([switch]$Brief)

  $now = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
  $battMsg = ''
  try {
    $batt = Get-CimInstance Win32_Battery -ErrorAction SilentlyContinue
    if ($batt -and $null -ne $batt.EstimatedChargeRemaining) {
      $battMsg = " | Battery: $($batt.EstimatedChargeRemaining)%"
    }
  } catch {}

  $ctx = Get-PsGitContext
  $loader = Join-Path $script:PocketShellDevToolsRoot 'pocket-shell-devtools.ps1'

  Write-Host ''
  Write-Host '================================================================================' -ForegroundColor Green
  Write-Host ' Pocket Shell DevTools' -ForegroundColor Green
  Write-Host " $now$battMsg" -ForegroundColor DarkGray
  if ($script:PocketShellAuthorName -and $script:PocketShellAuthorEmail) {
    Write-Host " Author: $($script:PocketShellAuthorName) | $($script:PocketShellAuthorEmail)" -ForegroundColor DarkGray
  }
  elseif ($script:PocketShellAuthorName) {
    Write-Host " Author: $($script:PocketShellAuthorName)" -ForegroundColor DarkGray
  }
  elseif ($script:PocketShellAuthorEmail) {
    Write-Host " Author: $($script:PocketShellAuthorEmail)" -ForegroundColor DarkGray
  }
  Write-Host " Code home: $($script:CODE_HOME)" -ForegroundColor DarkGray
  Write-Host " Default branch: $($script:PsDefaultBranch)" -ForegroundColor DarkGray
  Write-Host " Reload: . $loader" -ForegroundColor DarkGray
  Write-Host '================================================================================' -ForegroundColor Green

  Write-Host ''
  Write-Host 'Current context:' -ForegroundColor Cyan
  if ($ctx.InGit) {
    Write-Host "  Repo alias : $($ctx.RepoAlias)"
    Write-Host "  Repo folder: $($ctx.RepoFolder)"
    Write-Host "  Branch     : $($ctx.Branch)"
    Write-Host "  Git root   : $($ctx.GitRoot)"
    if ($ctx.Cwd -ne $ctx.GitRoot) { Write-Host "  Cwd        : $($ctx.Cwd)" -ForegroundColor DarkGray }
    if ($ctx.Dirty) { Write-Host '  Work tree  : dirty (uncommitted changes)' -ForegroundColor Yellow }
    else { Write-Host '  Work tree  : clean' -ForegroundColor DarkGreen }
    if ($ctx.Tracking) { Write-Host "  Tracking   : $($ctx.Tracking)" }
  }
  else {
    Write-Host "  Path       : $($ctx.Cwd)" -ForegroundColor Yellow
    Write-Host '  Git        : not inside a repository' -ForegroundColor Yellow
  }

  if ($Brief) {
    Write-Host ''
    Write-Host 'Type psh-help (or psinfo) for all commands.' -ForegroundColor DarkGray
    Write-Host ''
    return
  }

  Write-Host ''
  Write-Host 'Sections (configure in repo-map + local overrides):' -ForegroundColor Cyan
  Write-Host '  Terminal shortcuts  -> pocket-shell-devtools\shortcuts\'
  Write-Host '  Commit messages     -> f | b | gencommit'
  Write-Host '  Git shortcuts       -> gplm gpl gph gf gcom ... | <alias> <cmd> | psgit'
  Write-Host '  System navigation   -> root home clr .. ... .... | codebase codehere explore'
  Write-Host '  npm                 -> nrs nrb nrt nrw ngi'
  Write-Host '  node                -> nodev'
  Write-Host '  Angular             -> ngv (+ add project shortcuts under angular\)'
  Write-Host '  Utils               -> killport port ip which logs findtext reload'
  Write-Host '  Help / banner       -> psh-help psinfo | banner on profile load'

  Write-Host ''
  Write-Host 'Navigation:' -ForegroundColor Cyan
  Write-Host '  root, croot, home, clr, .., ..., ....'
  Write-Host '  codehere, codebase, explore'

  Write-Host ''
  Write-Host 'Git shortcuts:' -ForegroundColor Cyan
  Write-Host "  gplm gpl gph | gf gcom gbr | ga gs | gcm gacp gco gcob | nb <branch-name>"
  Write-Host "  gplm merges origin/$($script:PsDefaultBranch) into current branch (--no-ff)"
  Write-Host '  <repo-alias> <cmd>   e.g. sublime gplm   |   psgit sublime gf'

  Write-Host ''
  Write-Host 'Commit messages:' -ForegroundColor Cyan
  Write-Host '  f <id> <alias> [comment]   |   b <id> <alias>   |   gencommit -ListRepos'

  Write-Host ''
  Write-Host 'Repo aliases:' -ForegroundColor Cyan
  if ($script:RepoMap.Count -eq 0) {
    Write-Host '  (none — edit config\repo-map.ps1 or pocket-shell-devtools.local.ps1)' -ForegroundColor DarkGray
  }
  else {
    foreach ($key in $script:RepoMap.Keys) {
      Write-Host ('  {0,-14} -> {1}' -f $key, $script:RepoMap[$key])
    }
  }

  Write-Host ''
  Write-Host 'Environment (optional):' -ForegroundColor Cyan
  Write-Host '  POCKET_SHELL_CODE_HOME      override code folder (default: ~/Github or ~/code)'
  Write-Host '  POCKET_SHELL_DEFAULT_BRANCH override trunk branch (default: main)'
  Write-Host ''
}
