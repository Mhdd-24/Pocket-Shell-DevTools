function prompt {
  try {
    $t = (Get-Date).ToString('HH:mm:ss')
    $p = (Get-Location).Path
    Write-Host ''
    Write-Host "[ $t ] $p" -NoNewline
    return "`n> "
  }
  catch {
    return 'PS> '
  }
}
