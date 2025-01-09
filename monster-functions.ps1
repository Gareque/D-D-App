# Function to call monsters
function Get-Monster($monsterName, $baseUri) {
    $uri = "$baseUri/monsters/$monsterName"
    $resp = Invoke-WebRequest -Uri $uri -Method 'GET' -Headers $headers
    $monster = $resp.Content | ConvertFrom-Json
    return $monster
}

 # Handle Speed


# Function to print monster details
function Print-Monster($monster) {
    Write-Host "====== $($monster.name) ====== `n"

    Write-Host "Monster Details" -ForegroundColor Green
    Write-Host "Monster Type: $($monster.type)"
    Write-Host "Challenge Rating: $($monster.challenge_rating)"
    Write-Host "XP: $($monster.xp) `n"

    Write-Host "Movement Details:" -ForegroundColor Green
        foreach ($speed in $monster.speed) {
           foreach ($type in $monster.speed.PSObject.Properties) {
                Write-Host "$($type.Name): $($type.Value)"
            }}
            # To force a line break without it happening on every line
            Write-Host " "

    Write-Host "Monster's stats:" -ForegroundColor Green
    Write-Host "Hit Points: $($monster.hit_points)"
    Write-Host "AC: $($monster.armor_class.value) `n"
}