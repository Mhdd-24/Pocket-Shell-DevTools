function Global:gcm {
  param(
    [Parameter(ValueFromRemainingArguments = $true)][string[]]$Rest
  )
  $msg = ($Rest -join ' ').Trim()
  if (-not $msg) { Write-Host 'Usage: gcm "message"  or  gateway gcm Feat (123): msg' -ForegroundColor Yellow; return }
  git commit --trailer "Co-authored-by: Cursor <cursoragent@cursor.com>" -m $msg
}
