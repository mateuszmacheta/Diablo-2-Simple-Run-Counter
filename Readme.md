# Diablo 2 Simple Run Counter

## Introduction

This is simple run counter designed to work with Diablo 2 characters. I created this because I didn't bother to search for similar application. My goal was to create something simple yet useful.

By using PowerShell there's no installation needed, as it comes preinstalled with Windows. Moreover, PowerShell scripts are not compiled so you can easily see the script yourself and verify that it is not doing anything malicious.  

Script is not making any changes to your save files, but I recommend backing them up just in case.

## Features

It has only two screens: character selection screen and run details screen. After you select your character by entering number next to its name timer starts and you can start your runs. Then when your run ends and you Save And Exit it will update information and show run details screen with:

- character name
- run count
- last run time
- average run time
- total time

If you finish your runs and maybe would like to note down the results you can just do that after you end last run. Take your time, but you have 5 minutes to do that - see paragraph below for detailed explanation. Alternatively you can just press CTRL+C to terminate execution, details from run screen will stay there until you close PowerShell window. 

Please note that due to how Diablo 2 saves character files **it will not properly work for runs longer than 5 minutes**. It's because game saves character progress whenever you Save And Exit (obviously) and every 5 minutes. This script updates run counter whenever it noticed any updates in character save d2s file.

## Installation

Copy `getRunCount.ps1` file to your machine. Right click it and select Run with PowerShell. If you will see list of your characters then you're ready to go.
If PowerShell window opened for a moment and closed then you might have some error. To see error message open PowerShell (right clicking on Start Menu and selecting Windows PowerShell should do the trick). Navigate to folder where you placed the ps1 file by typing `cd 'Path_to_ps1_script'` (for example `cd 'C:\Users\Owner\Downloads'`). Then type name of the script (hit Tab for auto completion) and press enter. Error should appear in red colors.

### Most common errors
1) `Cannot index into a null array.`
This one means that you either have no characters in your save path, or you have incorrect save path. See **Changing save path** section. 

2) `.\getRunCount.ps1 : File (...) getRunCount.ps1 cannot be loaded
because running scripts is disabled on this system (...)`
This is because of script execution policy setting on your computer. Simples workaround is to just use batch file `getRunCount.bat`.

### Changing save path
Newer versions of Diablo 2 keep character saves in `Saved Games\Diablo II` folder in user profile. That is default setting. Older versions can keep them in `saves` folder located in Diablo 2 installation path.
In order to change Diablo 2 save files path edit `getRunCount.ps1` with text editor of your choice. (By default when you double click ps1 file it will open in Notepad in Windows 10) Change line where you have `$savePath = "$env:USERPROFILE\Saved Games\Diablo II"` to include your save path in double quotes, for example `$savePath = "C:\Program Files(x86)\Diablo II\saves"`.

## License
Script is provided As-Is. You can freely copy it and modify as you wish. No attribution needed.