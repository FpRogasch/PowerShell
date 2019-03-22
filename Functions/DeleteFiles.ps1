<#

Created:  March, 2019
Version:  1.0
Description:  Script, dass ...

#>

Function Get-Delete
{
	Param
	(
		[Parameter	(HelpMessage = "Please enter the age of the data that will be deleted", 
					Mandatory=$true)]
		[int]$Days
	)

	Process
	{

		# Variable
		$FolderPath = "U:\SFirm-Bilder" # Path where your folders are
		$BackupPath = "U:\SFirm-Bilder\backup" # Only for testing (Path where you will move the Folder, for testing)
		$DeleteTime = (get-date).addDays(-$Days)
		$Files = Get-ChildItem -Path $FolderPath -Recurse | Where {$_.PsIsContainer -and ($_.CreationTime -le $DeleteTime)} # Selection from Files, that older than $Days are. 
		$FileCount = 0
		
		Write-Host ""
		Write-Host "---- All Files older than", $Days, "days will be deleted."
		Write-Host ""

		ForEach($File in $Files){
			Write-Host "---- Deleted Folder: $File"
			move-item "$FolderPath\$File" -destination "$BackupPath\delete-test"
			$FileCount ++
		}
		
		Write-Host ""
		Write-Host "---- ($FileCount) Folder have been deleted."
		Write-Host ""
		Start-Sleep -Milliseconds 2000;

	}
}
