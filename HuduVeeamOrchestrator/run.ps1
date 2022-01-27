param($Context)
$ActivityURL = "https://api.checkcentral.cc/getChecks/?apiToken=c41529ece1b745a38bbedc71c3b34b74&checkId=502ddbaa-396c-410b-8787-38da0256f901&activityCount=10"
$company_name = "Banning Engineering"
$LatestStatus = $null
$HuduURL = "https://docs.structurepoint.com"
$HuduAPI = "kkcfmyv5jtV3Hzsij1wc6TsC"
New-HuduBaseURL -BaseURL $HuduURL
New-HuduAPIKey -ApiKey $HuduAPI
#$BanningJSON = $BanningJobs | ConvertFrom-Json

#$BanningParse = $BanningJSON.checks.activies



		$Activities = $null
		$Activities = Invoke-WebRequest -Uri $ActivityURL | Convertfrom-JSON
        $ActivitiesProcess = $Activities.checks.activities
		if ($Activities) {
        $ActivityTableTop = "<div class=`"nasa__block`"><header class='nasa__block-header'>
							<h1><i class='fas fa-info-circle icon'></i>Veeam Backup Jobs</h1>
							 </header><table><thead><th>Job Name</th><th>Status</th><th>Date</th></thead><tbody><tr><td>"
        $ActivityTableBottom = "</td></tr></tbody></table></div>"
        $ActivityColl = @()
        foreach ($activity in $ActivitiesProcess) {
			$ActivityName = $activity.Title
            $ActivityStatus = $activity.Status
            $ActivityString = "$ActivityName</td><td>$($activity.Status)</td><td>$($activity.updated)</td>"
            $ActivityColl += $ActivityString
        }
        if ($ActivityColl) {
            $ActivityString = $ActivityColl -join "</td></tr><tr><td>"
        }
        $ActivityTable = "{0}{1}{2}" -f $ActivityTableTop, $ActivityString, $ActivityTableBottom
		}

$LatestStatus = $null
$LatestStatusVariable = $activitiesprocess[0].Status
$LatestStatus = $LatestStatusVariable
$Messagetext = "Last Backup: "

$message = $Messagetext + $activitiesprocess[0].Status
$shadecolor = $null

#If ($LatestStatus = Success)

#{$shadecolor = "success"}else {$shadecolor = "danger"}

if ($LatestStatus -eq 'Success') {
  $shadecolor = "success"
} else {
  $shadecolor = "danger"
}


$MagicDash = Set-HuduMagicDash -title "Veeam Backup Status" -company_name $company_name -message $message -image_url "https://icon-library.com/images/veeam-icon/veeam-icon-9.jpg" -content $ActivityTable -shade $shadecolor

$MagicDash = Set-HuduMagicDash -title "Veeam Backup Status" -company_name $company_name -message $message -image_url "https://icon-library.com/images/veeam-icon/veeam-icon-9.jpg" -content $ActivityTable -shade $shadecolor
