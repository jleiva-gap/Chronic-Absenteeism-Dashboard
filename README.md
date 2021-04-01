# Chronic-Absenteeism-Dashboard

This repository provides a Chronic Absenteeism PowerBi Dashboard that is powered
off of the the Ed-Fi ODS with AMT - Analytics Middle Tier. This dashboard provides
row level security and filters data based on the users role. For example if a
District Superintendent logs in then it will show data for all schools. If a School
Principal is logged in he or she sees only data for his school. Subsequently a
teacher sees only the students to the sections she teaches.

Supports:

* Ed-Fi Data Standard 3.0 and higher
* Ed-Fi ODS/API Technical Suite 3, version 3.0 and higher

Quick Start
------------

We tried to make the setup and deploy of this dashboard as easy as possible.

If you already have PowerBi and an Ed-Fi ODS installed you can skip to the Setup section of this document.

For the quick start install please follow these steps:

**1)** Open a Windows PowerShell as and Administrator.
From the **Windows Menu**, search for **PowerShell**, right click on it, and select **Run as Administrator**
<br/><img src="img/powershell1.png" width="600" >

**2)** Run the automated installer by pasting this command in to the PowerShell window:
> Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://github.com/Ed-Fi-Exchange-OSS/Chronic-Absenteeism-Dashboard/raw/main/install.ps1'))

**3)** Once everything has finished installing you should see PowerBi and the "Chronic Absenteeism Dasbaord" open.
*Continue on the how to use the dashboard section.

How to use the Dashbaords
------------

**1)** If PowerBi is not already open, proceed to open it and the "Chronic Absenteeism Dashboard" PBIX file.

**2)** On the top menu locate and Click on the "Modeling" option.

**3)** On the ribbon menu click on View as. Make sure you select "Dynamic Role" & "Other user". Use one of the emails below in the input for "Other user" and click the OK button.


* District Superintendent - DavidWilson@edfi.org
* School Principal - ChadwickGarner@edfi.org
* Teacher - TrentNewton@edfi.org

**4)** After a few seconds the Dashboard will finish filtering the widgets to the role of the uset. 

Setup
------------


### Prerequisites ###

* Install Visual Studio Community Edition (https://visualstudio.microsoft.com/downloads/)
* Install MsSQL Developer Edition (https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
* Install SQL Server Management Studio (https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
* Download and restore Ed-Fi ODS s3v5.1.0 database
  * Download  from here: https://www.myget.org/F/ed-fi/api/v2/package/EdFi.Suite3.Ods.Populated.Template/5.1.0
* Download the code (https://github.com/Ed-Fi-Exchange-OSS/ParentPortal)
* Open code with Visual Studio Community Edition
* Open SQL Server Management Studio and run the following scripts in the order that they are listed to configure the Database.
    * Scripts are located at the following location "~/Student1.ParentPortal.Data/Scripts/edFi31/"
      * 1CreateParentPortalSupportingDatabaseSchema.sql
      * 2ODSExtensions.sql
      * 3StudentDetails.sql
      * 4SampleDataDemo.sql (For Demo Only)

* Compile project and Run it.

### Running the application for the first time ###

Before you begin make sure you have gone through all the Prerequisites listed above.

Test credentials
------------

Ensure that your application is running 

**Credentials:**

~~~
User:
   Email: perry.savage@toolwise.onmicrosoft.com
   Password: Parent123
~~~

Production Deployment Notes
------------

## Legal Information

Copyright (c) 2021 Ed-Fi Alliance, LLC and contributors.

Licensed under the [Apache License, Version 2.0](LICENSE) (the "License").

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

See [NOTICES](NOTICES.md) for additional copyright and license notifications.
