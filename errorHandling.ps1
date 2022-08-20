#script to open and parse an xml file

#grab the xml files full pathname
[string]$pathname = Read-Host "Enter an XML filename"

try
{
    #load into xml object; more efficient than using Get-Content and cast to XML
    $xml = New-Object -TypeName XML
    $xml.Load($pathname)

    #traverse the XML nodes and output desired info
    $xml.Books.Book | Select-Object -Property author,title, published
}
catch
{
    Write-Host "File not found"
}