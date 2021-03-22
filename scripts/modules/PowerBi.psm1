# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

############################################################

# Author: Douglas Loyo, Sr. Solutions Architect @ MSDF

# Description: Module contains a collection of utility functions for managing PowerBi.

############################################################

function Install-PowerBi {
    if(!(Find-SoftwareInstalled "Microsoft Power BI Desktop (x64)"))
    {
        Write-Host "     Installing: Power Bi..."
        choco install powerbi -y --ignore-checksums
    }else{Write-Host "     Skipping: Power Bi as it is already installed."}
}

# function Get-PowerBiTemplate {
#     $outputpath = "$global:pathToWorkingDir\ChronicAbsenteeismDashboard.pbit"
    
#     Write-Host "     Downloading PowerBI Template..."
#     $url = "http://toolwise.net/ChronicAbsenteeismDashboard.pbit"
    
#     Invoke-DownloadFile $url $outputpath
# }

function Open-PowerBiTemplate($pathToPBIXFile){
    Write-Host "     Opening Power Bi Chronic Absenteeism Dashboard"
    Write-Host "     $pathToPBIXFile"
    $directoryPath = $pathToPBIXFile
    Start-Process $directoryPath
}