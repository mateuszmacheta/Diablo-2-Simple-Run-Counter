cls

$savePath = "$env:USERPROFILE\Saved Games\Diablo II"
$saveFile = ''
$counter = 0

$files = Get-ChildItem -Path $savePath -Filter "*.d2s" | Sort-Object LastWriteTime -Descending

(0..($files.Count - 1)) | % { "#{0}`t`t{1}" -f ($_ + 1), $files[$_] }

$id = Read-Host "Please type character id (#)"

if ([int]$id -lt 1 -or [int]$id -gt $files.Count)
{ "Incorrect selection, exiting"; exit } 

$saveFile = $files[$id - 1].PSPath
$charname = $files[$id - 1].Name

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$runStopwatch = [System.Diagnostics.Stopwatch]::StartNew()

$lastSaved = (Get-Item $saveFile).LastWriteTime

while ($true)
{
    Start-Sleep -Seconds 1
    if ((Get-Item $saveFile).LastWriteTime -ne $lastSaved)
    {
        $lastSaved = (Get-Item $saveFile).LastWriteTime
        $counter++
        cls
        "Character:         $charname"
        "Runs:              $counter"
        "Last run time:     " + $runStopwatch.Elapsed.ToString().Substring(0, 8)
        "Average run time:  " + [TimeSpan]::FromTicks($stopwatch.Elapsed.Ticks / $counter).ToString().Substring(0, 8)
        "Total time:        " + $stopwatch.Elapsed.ToString().Substring(0, 8)
        $runStopwatch.Restart()
    }
}