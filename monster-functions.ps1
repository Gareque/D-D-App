# Function to call monsters
function Get-Monster($monsterName, $baseUri) {
    $uri = "$baseUri/monsters/$monsterName"
    $resp = Invoke-WebRequest -Uri $uri -Method 'GET' -Headers $headers
    $monster = $resp.Content | ConvertFrom-Json
    return $monster
}

# Function to print monster details
function Print-Monster($monster) {
    Write-Host "====== $($monster.name) ======"
    Write-Host "Monster Type: $($monster.type)"
    Write-Host "Hit Points: $($monster.hit_points)"
    Write-Host "Challenge Rating: $($monster.challenge_rating)"
}