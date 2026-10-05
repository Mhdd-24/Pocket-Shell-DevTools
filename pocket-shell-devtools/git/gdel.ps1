function Global:gdel {
  param(
    [Parameter(ValueFromRemainingArguments = $true)][string[]]$Rest
  )
  if (-not $Rest -or -not $Rest[0]) { Write-Host 'Usage: gdel <branch>' -ForegroundColor Yellow; return }
  git branch -D $Rest[0]
}
