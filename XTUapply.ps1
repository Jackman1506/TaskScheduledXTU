[System.Reflection.Assembly]::LoadFrom("C:\Program Files (x86)\Intel\Intel(R) Extreme Tuning Utility\Client\ProfilesApi.dll") | Out-Null

[ProfilesApi.XtuProfileReturnCode]$applyProfileResult = 0
$profileApi = [ProfilesApi.XtuProfiles]::new()
$profileApi.Initialize() | Out-Null

[ProfilesApi.XtuProfileReturnCode]$result = 0
$profiles = $profileApi.GetProfiles([ref] $result)

$profile = $profiles | Where-Object { $_.ProfileName -eq "PROFILE-NAME-GOES-HERE" } | Select-Object -First 1

if ($profile) {
    $applied = $profileApi.ApplyProfile($profile.ProfileID, [ref]$applyProfileResult)
    if ($applied) {
        Write-Host "$applyProfileResult. XTU Profile applied."
    } else {
        Write-Host "$applyProfileResult. Something went wrong. Please refer to the Github Repository." 
    }
}

sleep 10
