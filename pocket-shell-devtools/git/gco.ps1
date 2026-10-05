function Global:gco {
  param(
    [Parameter(ValueFromRemainingArguments = $true)][string[]]$Rest
  )
  if (-not $Rest -or -not $Rest[0]) { Write-Host 'Usage: gco <branch>  or  gateway gco master' -ForegroundColor Yellow; return }
  git checkout $Rest[0]
}
