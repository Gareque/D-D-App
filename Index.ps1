# $uri = 'https://www.dnd5eapi.co/api/'

# $userCategory = Read-Host "What category would you like to call?"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json")

# Setting the category to be pulled from
Write-Host "Please choose the category you want to look at?" -ForegroundColor Cyan
$category = Read-Host

Write-Host "You chose ${category}." -ForegroundColor Green

# Setting the URI for the API call
$uri = "https://www.dnd5eapi.co/api/${category}/"

# Confirming the sub-category to call from
Write-Host "Please confirm which ${category} you would like to know about" -ForegroundColor Cyan

$userInput = Read-Host

$response = Invoke-RestMethod $uri/$userInput -Method 'GET' -Headers $headers
$response | ConvertTo-Json