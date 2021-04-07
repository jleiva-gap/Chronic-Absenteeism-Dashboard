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

We tried to make this Quick Start as easy as possible to demo.

Please click on this link and login with the users and roles provided below:

Report URL: [PowerBi Chronic Absenteeism Dasboard](https://app.powerbi.com/groups/4725d1f3-419c-4222-a15f-d31add3eca89/reports/cea1b35c-9f77-4970-bfdb-037a3b83164f?ctid=8f4a8ef8-bdcb-43ac-8f20-a297b8f71a6a)

Password for all accounts is: Ed-Fi!sCool
Users:
<table>
<tr>
  <th>Position Title</th>
  <th>Name</th>
  <th>Email/Username</th>
</tr>
<tr>
  <td>Superintendent at Grand Bend ISD</td><td>David Wilson</td><td>dwilson@edfidev.onmicrosoft.com</td>
</tr>
<tr>
  <td>Principal at Grand Bend High</td><td>Alisa Cameron</td><td>acameron@edfidev.onmicrosoft.com</td>
</tr>
<tr>
  <td>Principal at Grand Bend Middle</td><td>Marjorie Montoya</td><td>mmontoya@edfidev.onmicrosoft.com</td>
</tr>
<tr>
  <td>Principal at Grand Bend Elementary</td><td>Chadwick Garner</td><td>cgarner@edfidev.onmicrosoft.com</td>
</tr>
<tr>
  <td>Teacher at Grand Bend Elementary</td><td>Janet Reid</td><td>jreid@edfidev.onmicrosoft.com</td>
</tr>
<tr>
  <td>Teacher at Grand Bend High</td><td>Russell Gomez</td><td>rgomez@edfidev.onmicrosoft.com</td>
</tr>
<tr>
  <td>Teacher at Grand Bend High</td><td>Sara Preston</td><td>spreston@edfidev.onmicrosoft.com</td>
</tr>
<tr>
  <td>Teacher at Grand Bend High</td><td>Trent Newton</td><td>tnewton@edfidev.onmicrosoft.com</td>
</tr>
 </table>


Install Localy or on a VM
------------
To run this demo locally on your machine or on a virtual machine please follwo these steps:

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


## Legal Information

Copyright (c) 2021 Ed-Fi Alliance, LLC and contributors.

Licensed under the [Apache License, Version 2.0](LICENSE) (the "License").

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

See [NOTICES](NOTICES.md) for additional copyright and license notifications.
