# Define Headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json")

# Defining the base URL:
$baseUri = "https://www.dnd5eapi.co/api"

# Function to call spells:
function Get-Spell($spellName, $baseUri) {
    $uri = "$baseUri/spells/$spellName"
    $resp = Invoke-WebRequest -Uri $uri -Method 'GET' -Headers $headers
    $spell = $resp.Content | ConvertFrom-Json
    return $spell
}

# Function to call monsters
function Get-Monster($monsterName, $baseUri) {
    $uri = "$baseUri/monsters/$monsterName"
    $resp = Invoke-WebRequest -Uri $uri -Method 'GET' -Headers $headers
    $monster = $resp.Content | ConvertFrom-Json
    return $monster
}

# Function to print the spell details
function Print-Spell($Spell) {
        Write-Host "====== $($Spell.name) ====== `n"
    
        Write-Host "Spell Details:" -ForegroundColor Green
        Write-Host "School of Magic: $($Spell.school.name)"
        Write-Host "Spell Level: $($Spell.level)"
        Write-Host "Spell Name: $($Spell.name) `n"
        
        Write-Host "Spell Damage:" -ForegroundColor Green
            if ($Spell.level -eq '0') {
            Write-Host "Damage: $($Spell.damage.damage_at_character_level) `n" 
        } else {
            Write-Host "Damage: $($Spell.damage.damage_at_slot_level) `n"
        }
        Write-Host "Saves:" -ForegroundColor Green
        Write-Host "Save Stat: $($Spell.dc.dc_type.name)"
        if ($Spell.dc.dc_success -eq 'half') {
        Write-Host "Damage on Success: $($Spell.dc.dc_success) `n"
        } else {
            Write-Host "Damage on Success: N/A `n"
        }

        Write-Host "Spell range and shape:" -ForegroundColor Green
        Write-Host "Area of Effect: $($Spell.area_of_effect.size)"
        Write-Host "Spell shape: $($Spell.area_of_effect.type) `n"
    }

# Function to print monster details
function Print-Monster($monster) {
    Write-Host "====== $($monster.name) ======"
    Write-Host "Monster Type: $($monster.type)"
    Write-Host "Hit Points: $($monster.hit_points)"
    Write-Host "Challenge Rating: $($monster.challenge_rating)"
}

# Main script
Write-Host "Would you like to query a spell or a monster?" -ForegroundColor Cyan
$category = Read-Host "Enter 'spell' or 'monster'"

if ($category -eq 'spell') {
    $spellName = Read-Host "Enter the spell name"
    $spell = Get-Spell -spellName $spellName -baseUri $baseUri
    Print-Spell -spell $spell
} elseif ($category -eq 'monster') {
    $monsterName = Read-Host "Enter the monster name"
    $monster = Get-Monster -monsterName $monsterName -baseUri $baseUri
    Print-Monster -monster $monster
} else {
    Write-Host "Invalid category.  Please enter 'spell' or 'monster'" -ForegroundColor Red
}