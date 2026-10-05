function Global:port {
  param([Parameter(Mandatory = $true, Position = 0)][int]$PortNumber)
  $conns = Get-NetTCPConnection -LocalPort $PortNumber -ErrorAction SilentlyContinue
  if (-not $conns) {
    Write-Host "No process listening on port $PortNumber" -ForegroundColor Yellow
    return
  }
  $conns |
    Select-Object -ExpandProperty OwningProcess -Unique |
    ForEach-Object {
      $proc = Get-Process -Id $_ -ErrorAction SilentlyContinue
      [pscustomobject]@{
        Port = $PortNumber
        PID  = $_
        Name = if ($proc) { $proc.ProcessName } else { '(unknown)' }
        Path = if ($proc) { $proc.Path } else { $null }
      }
    } | Format-Table -AutoSize
}
