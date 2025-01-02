# $uri = 'https://www.dnd5eapi.co/api/'

# $userCategory = Read-Host "What category would you like to call?"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json")
$category = Read-Host "What category would you like this to be about?"
$uri = "https://www.dnd5eapi.co/api/${category}/"

Write-Host "You chose ${category}."

$userInput = Read-Host "Please confirm which ${category} you would like to know about"

$response = Invoke-RestMethod $uri/$userInput -Method 'GET' -Headers $headers
$response | ConvertTo-Json