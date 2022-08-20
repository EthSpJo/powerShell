# This program obtains CPU temperature and based on user input, converts it into either fahrenheit or celcius

#let user select celsius or fahrenheit
$choice = Read-Host "Select celsius or Fahrenheit "

#get base temperature
$data = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
$kelvin=@()
$kelvin = ($data.CurrentTemperature) / 10

if($choice -eq "celsius")
{
    #convert to celcius
    $cels = $kelvin - 273
    Write-Host "Temperature in celsius: $cels"
}
elseif($choice -eq "fahrenheit")
{
    #convret to fahrenheit
    $fah = (1.8 * ($kelvin - 273)) + 32
    Write-Host "Temperature in fahrenheit: $fah `n"
}
else
{
    Write-Host "Invalid selection"
}
