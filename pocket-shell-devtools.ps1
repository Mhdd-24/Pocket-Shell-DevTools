# =============================================================================
# Pocket Shell DevTools — main loader
# =============================================================================
# Generic PowerShell shortcuts for a personal laptop (git, nav, npm, Angular, utils).
# Separate from Workspace DevTools — do not mix loaders in one profile.
#
# Profile:
#   . C:\path\to\Pocket-Shell-DevTools\pocket-shell-devtools.ps1
#
# Reload:
#   reload
# =============================================================================

if ($Global:PocketShellDevToolsLoaded) {
  return
}
$Global:PocketShellDevToolsLoaded = $true

$script:PocketShellDevToolsRoot = $PSScriptRoot
$script:PocketShellDevToolsModuleDir = Join-Path $PSScriptRoot 'pocket-shell-devtools'

if (-not (Test-Path -LiteralPath $script:PocketShellDevToolsModuleDir)) {
  Write-Host "Pocket Shell DevTools modules folder missing: $script:PocketShellDevToolsModuleDir" -ForegroundColor Red
  return
}

$script:PocketShellDevToolsModules = @(
  # --- config ---
  'config\paths.ps1'
  'config\repo-map.ps1'
  'config\load-local-overrides.ps1'
  'config\author.ps1'

  # --- terminal shortcuts (custom commands; extend per user) ---
  'shortcuts\register-shortcuts.ps1'

  # --- commit messages ---
  'commit\Show-PsRepoHelp.ps1'
  'commit\Invoke-GenCommitMsg.ps1'
  'commit\f.ps1'
  'commit\b.ps1'
  'commit\gencommit.ps1'

  # --- git shortcuts ---
  'git\gplm.ps1'
  'git\gpl.ps1'
  'git\gph.ps1'
  'git\gphn.ps1'
  'git\gphf.ps1'
  'git\gf.ps1'
  'git\gpf.ps1'
  'git\gcom.ps1'
  'git\gbr.ps1'
  'git\ga.ps1'
  'git\gs.ps1'
  'git\gcm.ps1'
  'git\gacp.ps1'
  'git\gco.ps1'
  'git\gcob.ps1'
  'git\gbl.ps1'
  'git\gdel.ps1'
  'git\gundo.ps1'
  'git\greseth.ps1'
  'git\gst.ps1'
  'git\gsta.ps1'
  'git\gl.ps1'
  'git\Invoke-PsGitShortcut.ps1'
  'git\newbranch.ps1'

  # --- system navigation ---
  'nav\clr.ps1'
  'nav\up-one.ps1'
  'nav\up-two.ps1'
  'nav\up-three.ps1'
  'nav\home.ps1'
  'nav\root.ps1'
  'nav\croot.ps1'
  'nav\Go-PsCodeRepo.ps1'
  'nav\Invoke-PsRepoGit.ps1'
  'nav\Register-RepoAliases.ps1'
  'nav\psgit.ps1'

  # --- npm ---
  'npm\nrs.ps1'
  'npm\nrb.ps1'
  'npm\nrt.ps1'
  'npm\nrw.ps1'
  'npm\ngi.ps1'

  # --- node ---
  'node\nodev.ps1'

  # --- angular ---
  'angular\ngv.ps1'

  # --- utils ---
  'util\port.ps1'
  'util\killport.ps1'
  'util\ip.ps1'
  'util\codehere.ps1'
  'util\codebase.ps1'
  'util\explore.ps1'
  'util\logs.ps1'
  'util\findtext.ps1'
  'util\which.ps1'
  'util\reload.ps1'

  # --- help / banner / prompt ---
  'help\Get-PsGitContext.ps1'
  'help\Show-PocketShellInfo.ps1'
  'help\psh-help.ps1'
  'help\psinfo.ps1'
  'help\prompt.ps1'
  'help\banner.ps1'
)

foreach ($moduleRel in $script:PocketShellDevToolsModules) {
  $modulePath = Join-Path $script:PocketShellDevToolsModuleDir $moduleRel
  if (-not (Test-Path -LiteralPath $modulePath)) {
    Write-Host "Pocket Shell DevTools module missing: $moduleRel" -ForegroundColor Red
    continue
  }
  . $modulePath
}
