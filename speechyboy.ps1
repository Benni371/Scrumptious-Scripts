
function Send-Announcement{


[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)][String]$TargetComputer,
    [Parameter(Mandatory=$true)][String]$Message

)
process{
try{
    
    Enter-PSSession -ComputerName $TargetComputer
    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.SelectVoice('Microsoft Zira Desktop')
    $speak.Speak($Message)
    #this code ejects the cd drive if they have one
    # $sh = New-Object -ComObject "Shell.Application"
    # $sh.Namespace(17).Items() |  Where-Object { $_.Type -eq "CD Drive" } | ForEach-Object { $_.InvokeVerb("Eject") }
    Exit-PSSession
}
catch{
    Write-Host "Host not Found! Try again."
}

}
}

