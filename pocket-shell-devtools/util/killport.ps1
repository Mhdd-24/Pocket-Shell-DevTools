function Global:killport {
  param([Parameter(Mandatory = $true, Position = 0)][int]$PortNumber)
  $pids = @(
    Get-NetTCPConnection -LocalPort $PortNumber -ErrorAction SilentlyContinue |
      Select-Object -ExpandProperty OwningProcess -Unique
  )
  if (-not $pids -or $pids.Count -eq 0) {
    Write-Host "No process listening on port $PortNumber" -ForegroundColor Yellow
    return
  }
  foreach ($procId in $pids) {
    $proc = Get-Process -Id $procId -ErrorAction SilentlyContinue
    $name = if ($proc) { $proc.ProcessName } else { 'unknown' }
    try {
      Stop-Process -Id $procId -Force -ErrorAction Stop
      Write-Host "Killed PID $procId ($name) on port $PortNumber" -ForegroundColor Green
    } catch {
      Write-Host "Failed to kill PID $procId ($name): $($_.Exception.Message)" -ForegroundColor Red
    }
  }
}
