# Define Headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json")

# Defining the base URL:
$baseUri = "https://www.dnd5eapi.co/api"

# Importing the modules
. .\spell-functions.ps1
. .\monster-functions.ps1

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