function Global:Invoke-PsGitShortcut {
  param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Rest
  )
  if (-not $Rest -or $Rest.Count -eq 0) { return }
  $cmd = $Rest[0].ToLowerInvariant()
  $cmdArgs = if ($Rest.Count -gt 1) { $Rest[1..($Rest.Count - 1)] } else { @() }
  switch ($cmd) {
    'gplm'    { gplm }
    'gpl'     { gpl }
    'gph'     { gph }
    'gphn'    { gphn }
    'gphf'    { gphf }
    'gf'      { gf }
    'gpf'     { gpf }
    'gcom'    { gcom }
    'gbr'     { gbr }
    'gs'      { gs }
    'ga'      { ga }
    'gst'     { gst }
    'gsta'    { gsta }
    'gl'      { gl }
    'gbl'     { gbl }
    'gundo'   { gundo }
    'greseth' { greseth }
    'gcm'     { gcm @cmdArgs }
    'gacp'    { gacp @cmdArgs }
    'gco'     { gco @cmdArgs }
    'gcob'    { gcob @cmdArgs }
    'gdel'    { gdel @cmdArgs }
    default {
      Write-Host "Unknown shortcut '$cmd'." -ForegroundColor Yellow
      Write-Host 'Supported: gplm gpl gph gphn gphf gf gpf gcom gbr gs ga gst gsta gl gbl gundo greseth gcm gacp gco gcob gdel' -ForegroundColor DarkGray
    }
  }
}
