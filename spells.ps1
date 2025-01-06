# Step 1: Fetch the complete spell list from the API
$response = Invoke-WebRequest -Uri "https://www.dnd5eapi.co/api/spells" -Method 'GET'

# Step 2: Convert the JSON response to a PowerShell object
$spellList = $response.Content | ConvertFrom-Json

# Step 3: Write the spell list to a JSON file
$spellList.results | ConvertTo-Json -Depth 3 | Out-File "spells.json"