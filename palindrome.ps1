#boolean - true if equal, false not
$palindrome = 1

#get user input
$word = Read-Host "Enter word to check"

#split word into array
$w_arr = $word.ToCharArray()
$w2 = $w_arr
$l = $w_arr.Length - 1

for($i=0; $i -lt $w_arr.Length; $i++)
{
    if($w_arr[$i] -ne $w2[$l])
    {
        $palindrome = 0
    }
    $l--
}

if($palindrome -eq 0)
{
    Write-Host " $word is not a palindrome"
}
else
{
    Write-Host " $word is a palindrome"
}