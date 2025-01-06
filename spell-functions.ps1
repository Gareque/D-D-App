# Function to call spells:
function Get-Spell($spellName, $baseUri) {
    $uri = "$baseUri/spells/$spellName"
    $resp = Invoke-WebRequest -Uri $uri -Method 'GET' -Headers $headers
    $spell = $resp.Content | ConvertFrom-Json
    return $spell
}



# Function to print the spell details
function Print-Spell($Spell) {
        Write-Host "====== $($Spell.name) ====== `n"
    
        Write-Host "Spell Details:" -ForegroundColor Green
        Write-Host "School of Magic: $($Spell.school.name)"
        Write-Host "Spell Level: $($Spell.level)"
        Write-Host "Spell Name: $($Spell.name) `n"

        Write-Host "Spell description" -ForegroundColor Green
        Write-Host $Spell.desc `n
        
        Write-Host "Spell Damage:" -ForegroundColor Green
            if ($Spell.level -eq '0') {
            Write-Host "Damage: $($Spell.damage.damage_at_character_level) `n" 
        } else {
            Write-Host "Damage: $($Spell.damage.damage_at_slot_level) `n"
        }

        Write-Host "Saves:" -ForegroundColor Green

        if ($Spell.area_of_effect) { 
        Write-Host "Save Stat: $($Spell.dc.dc_type.name)" 
            if ($Spell.dc.dc_success -eq 'half') {
                Write-Host "Damage on Success: $($Spell.dc.dc_success) `n"
            } else {
                Write-Host "Damage on Success: N/A `n"
            } } else { Write-Host "Spell saves are not applicable for this spell `n" }

        Write-Host "Spell range and shape:" -ForegroundColor Green
        if ($Spell.area_of_effect) { 
            Write-Host "Area of Effect: $($Spell.area_of_effect.size)"
            Write-Host "Spell shape: $($Spell.area_of_effect.type) `n"
        } else {Write-Host "This spell has no shape"}
    }
