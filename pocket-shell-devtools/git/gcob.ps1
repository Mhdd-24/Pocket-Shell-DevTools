function Global:gcob {
  param(
    [Parameter(ValueFromRemainingArguments = $true)][string[]]$Rest
  )
  if (-not $Rest -or -not $Rest[0]) { Write-Host 'Usage: gcob <branch>  or  gateway gcob feature/foo' -ForegroundColor Yellow; return }
  git checkout -b $Rest[0]
}
