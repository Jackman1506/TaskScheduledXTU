# Task Scheduled XTU
<br> This is a simple way of applying an XTU profile on boot without the use of hibernation, fast startup or opening the XTU Software. <br/> 
<br> *(Please note, this is only tested on the XTU version provided here. Some newer versions do not contain **XtuCLI.exe**)* <br/>

# Installation
<br> First you will need to install the XTU.exe provided in this repo.  You are welcome to try your own version, but please check that XtuCLI.exe is in your XTU directory.      After installation and reboot, make and save a profile on XTU containing the variables you'd like applied on startup. <br/>
<br> Next, download the XTUapply.ps1 and place it somewhere on your drive, e.g. Documents. <br/>
<br> Edit the XTUapply.ps1. On line 10 you will see '{ $_.ProfileName -eq "PROFILE-NAME-GOES-HERE" }'. <br/>
Change "PROFILE-NAME-GOES-HERE" to the name of the profile you'd like applied on startup and save it. 
> '{ $_.ProfileName -eq "overclock" }'

<br> Open Task Scheduler.  You will need to make a new task called XTUhelper.  check the 'Run only when user has logged in' option and 'Run with the highest privileges'. <br/>
<br> Head over to the 'Triggers' tab and add a new trigger that starts at log on.  Delay the task for 5 seconds and check the 'Enabled' Box. Leave every other box unchecked. <br/>
<br> In the 'Actions' tab, add a new action to start a program.  In the 'Program/script:' box add this location: 
> *C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe* <br/>

<br> In the 'Add Arguments' box you will need to direct it to the location of your XTUapply.ps1 file.
> -noprofile -executionpolicy unrestricted -file "C:\Users\Jack\Documents\XTUapply.ps1" <br/>

<br> Leave everything unchecked in the 'Settings' and 'Conditions' tabs except for 'Allow task to be run on demand'. Click Okay to save the task.<br/>
<br> If you have followed all of these steps, you can now reboot. You should see the PowerShell window open on boot. It will disappear after applying your chosen profile. <br/>

# FAQ
<br> Why would I need this. Intel XTU already applies profiles at startup?
> This is correct, but Intel XTU relies on faststartup/hibernation to do this. In some cases, faststartup/hibernation can cause black screen issues on boot. In other cases (e.g. Some Chinese Motherboards), Intel Extreme Tuning Utility can cause resource hog issues if left open long enough at a high overclock.<br/>

<br> I got an error. 'Something went wrong'?
> Please raise an issue and attach your hardware information so I can communicate with you directly. <br/>

<br> Where can I find the original brains of the .ps1 script?
> [Michael Baker's GitHub](https://github.com/michael-baker)<br/>
