function Global:findtext {
  param(
    [Parameter(Mandatory = $true, Position = 0)][string]$Pattern,
    [Parameter(Position = 1)][string]$Path = '.',
    [string]$Include = '*'
  )
  if (Get-Command rg -ErrorAction SilentlyContinue) {
    rg --line-number --color never --glob $Include $Pattern $Path
    return
  }
  Get-ChildItem -LiteralPath $Path -Recurse -File -Filter $Include -ErrorAction SilentlyContinue |
    Select-String -Pattern $Pattern |
    Select-Object -First 200 Path, LineNumber, Line
}
