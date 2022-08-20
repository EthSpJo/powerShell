# provided server script

function script:Listen-Msg
{
    param([int]$port)
    $ipv4 = [System.Net.IPAddress]::any, $port
    $socket = New-Object System.Net.IPEndPoint($ipv4)
    $server = New-Object System.Net.Sockets.TcpListener $socket
    Write-Host "Listening on $port ..." -foregroundcolor Green
    $server.Start()
    $client_connection = $server.AcceptTcpClient()
    $client = $client_connection.Client.RemoteEndPoint.Address
    Write-Host "Accepted connection from $client" -ForegroundColor Green

    [System.IO.StreamReader]$stream = New-Object System.IO.StreamReader -ArgumentList $client_connection.GetStream()

    $line = $stream.ReadLine()
    if($line -ne $null)
    {
        Write-Host $line -ForegroundColor Cyan
    }
    $server.Stop()
}
Listen-Msg 1066