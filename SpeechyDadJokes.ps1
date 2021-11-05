function Send-Announcement{


    [CmdletBinding()]
    param (
    
    )
    process{
    try{
        # call dad joke API
        $response = Invoke-RestMethod -Uri "https://icanhazdadjoke.com/" -Headers @{Accept = 'application/json'}
        # Initialize speech synth
        Add-Type -AssemblyName System.speech
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        # grab joke field from response and speak
        $speak.SelectVoice('Microsoft Zira Desktop')
        $speak.Speak($response.joke)
        #this code ejects the cd drive if they have one
        $sh = New-Object -ComObject "Shell.Application"
        $sh.Namespace(17).Items() |  Where-Object { $_.Type -eq "CD Drive" } | ForEach-Object { $_.InvokeVerb("Eject") }
        
    }
    catch{
        Write-Host "Host not Found! Try again."
    }
    
    }
    }