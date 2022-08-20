function script:Send-Msg()
{
    param([int]$port)

    $client = New-Object System.Net.Sockets.TcpClient
    $client.Connect("localhost", $port)

    $stream = New-Object System.IO.StreamWriter $client.GetStream()
    $stream.WriteLine("Mr. Watson--come here--I Want to see you.")
    $stream.Flush();
    Write-Host "Message sent." -ForegroundColor Green
    $client.close()
}
Send-Msg 1066