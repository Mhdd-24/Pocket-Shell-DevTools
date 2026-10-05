function Global:ip {
  Get-NetIPAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue |
    Where-Object {
      $_.IPAddress -notlike '127.*' -and
      $_.PrefixOrigin -ne 'WellKnown'
    } |
    Select-Object IPAddress, InterfaceAlias, PrefixLength |
    Format-Table -AutoSize
}
