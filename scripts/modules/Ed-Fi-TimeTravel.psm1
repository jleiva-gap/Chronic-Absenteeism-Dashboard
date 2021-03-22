# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

############################################################

# Author: Douglas Loyo, Sr. Solutions Architect @ MSDF

# Description: Module contains functions that support the install of the Ed-Fi Time Travel Scripts.

############################################################

function Install-EdFiTimeTravel($connStr) {
    Write-Host "    Downloading Ed-Fi Time Travel"
    $url = "https://github.com/Ed-Fi-Exchange-OSS/Ed-Fi-Sample-Data-Time-Travel-Script/archive/main.zip"
    $outputpath = "$global:pathToBinaries\EdFi.TimeTravel.zip"
    Invoke-DownloadFile $url $outputpath

    Write-Host "    Unziping Ed-Fi Time Travel"
    $unzipPath = "$global:pathToWorkingDir\TimeTravel"
    Expand-Archive -LiteralPath $outputpath -DestinationPath $unzipPath -Force

    $pathToScript = "$unzipPath\Ed-Fi-Sample-Data-Time-Travel-Script-main\UpgradeODSToCurrentSchoolYear.sql"
    # Update the USE [DBName] section to our db.
    (Get-Content -Path $pathToScript) -replace 'DBName', $global:populatedTemplateDatabaseName | Set-Content -Path $pathToScript
    # Execute the script    
    Write-Host "    Executing Ed-Fi Time Travel (This might take a minute or two)"
    Invoke-Sqlcmd -InputFile $pathToScript  -ConnectionString $connStr
}