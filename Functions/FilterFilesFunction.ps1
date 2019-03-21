<#

Created:  March, 2019
Version:  1.0
Description:  Script, dass ...

#>

Function Get-Filter
{
	[CmdletBinding()]
	Param(	
	
		[Parameter (Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[Alias("FilesFolder")]
		[String]$Path# = "U:\SFirm-Bilder" # Replace it for you files path.
	
	)
	
	#Variablen
	$files = Get-ChildItem $Path\*.png -Recurse # In my case i need filter PNG Files.

	# Organize files by date.
	Write-host "---- Files will be organized by creation date. ----"
	Start-Sleep -Milliseconds 1000;

	$files | ForEach{ 
		$x = $_.CreationTime.ToShortDateString()
		$NewFolderName = Get-Date $x -Format dd.MM.yyyy
		$DestinationPath = "U:\SFirm-Bilder\$NewFolderName"

		if (test-path $DestinationPath){ 
			move-item $_.fullname $DestinationPath 
		} 
		else {
			new-item -ItemType directory -Path $DestinationPath
			move-item $_.fullname $DestinationPath 
		}
	}
Start-Sleep -Milliseconds 2000;
Write-host ""
Write-host "----------- The files have been sorted. -----------"
Write-host "---------------------------------------------------"
Start-Sleep -Milliseconds 2000;
}

