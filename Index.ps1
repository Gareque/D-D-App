# $uri = 'https://www.dnd5eapi.co/api/'

# $userCategory = Read-Host "What category would you like to call?"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json")

Write-Host "Please choose the category you want to look at?" -ForegroundColor Cyan
$category = Read-Host

Write-Host "You chose ${category}." -ForegroundColor Green

$uri = "https://www.dnd5eapi.co/api/${category}/"

Write-Host "Please confirm which ${category} you would like to know about" -ForegroundColor Cyan

$userInput = Read-Host

$response = Invoke-RestMethod $uri/$userInput -Method 'GET' -Headers $headers
$response | ConvertTo-Json