function Global:logs {
  param(
    [int]$Count = 25,
    [string]$Path = '.'
  )
  $items = Get-ChildItem -LiteralPath $Path -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object {
      $_.Extension -match '\.(log|txt|out)$' -or
      $_.Name -match '(log|error|debug|trace)'
    } |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First $Count
  if (-not $items) {
    Write-Host "No recent log-like files under $Path" -ForegroundColor Yellow
    return
  }
  $items | Select-Object LastWriteTime, Length, FullName | Format-Table -AutoSize
}
