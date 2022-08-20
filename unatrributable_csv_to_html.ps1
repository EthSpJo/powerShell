#Obtain file path
[string]$pathname = Read-Host "Enter file path"

#check if file path exists
if([System.Io.File]::Exists($pathname))
{
     #Obtain the css file to control the produced HTML file
     [string]$csspath = Read-Host "Enter css file path"

     #validate the file exists and if not keep asking until you get one.
     while(-not ([System.Io.File]::Exists($csspath)))
     {
        [string]$csspath = Read-Host "invalid file `n Enter Css file"
     }

    #try and convert
    try
    {
        Import-Csv $pathname | ConvertTo-Html -CssUri $csspath| Out-File 'c:\users\user\desktop\htmlVer.html'
        Write-Host "Successfull conversion, HTML file is as follows `n"
        Get-Content 'c:\users\user\desktop\htmlVer.html'
    }
    catch
    {
        Write-Host "Conversion to HTML unsuccessfull"
    }
}
else
{
    Write-Host "$pathname does not exist"
}