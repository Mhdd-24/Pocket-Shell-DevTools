function Global:codebase {
  if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
    Write-Host 'VS Code CLI (code) not found on PATH' -ForegroundColor Red
    return
  }
  code $script:CODEBASE
}
