function Print-Spell($Spell) {
        Write-Host "====== $($Spell.name) ====== `n"
    
        Write-Host "Spell Level:   $($Spell.level)"
        Write-Host "Spell Name:     $($Spell.name)"
    }

    $resp = Invoke-WebRequest -Uri "https://www.dnd5eapi.co/api/spells/fireball"
    
    $Spell = $resp | ConvertFrom-Json
    
    Print-Spell -Spell $Spell