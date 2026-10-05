function Global:gacp {
  param(
    [Parameter(ValueFromRemainingArguments = $true)][string[]]$Rest
  )
  $msg = ($Rest -join ' ').Trim()
  if (-not $msg) { Write-Host 'Usage: gacp "message"' -ForegroundColor Yellow; return }
  git add .
  git commit --trailer "Co-authored-by: Cursor <cursoragent@cursor.com>" -m $msg
  if ($LASTEXITCODE -ne 0) { return }
  git push
}
