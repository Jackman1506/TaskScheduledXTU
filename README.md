# Task Scheduled XTU
<br> This is a simple way of applying an XTU profile on boot without the use of hibernation, fast startup or opening the XTU Software. <br/> 
<br> *(Please note, this is only tested on the XTU version provided here. Some newer versions do not contain XtuCLI.exe)* <br/>

# Installation
<br> First you will need to install the XTU.exe provided in this repo.  You are welcome to try your own version but please check that XtuCLI.exe is in your XTU directory.      After installation and reboot, make and save a profile on XTU containing the variables youd like applied on startup. <br/>
<br> Next, download the XTUapply.ps1 and place it in a safe but easy accessable place on your drive. <br/>
<br> Edit the XTUapply.ps1. On line 10 you will see '{ $_.ProfileName -eq "PROFILE-NAME-GOES-HERE" }'. <br/>
Change "PROFILE-NAME-GOES-HERE" to the name of the profile you'd like applied on startup and save it. 
> '{ $_.ProfileName -eq "overclock" }'

<br> Open Task Scheduler.  You will need to make a new task called XTUhelper.  Tick the 'Run only when user has logged in' option and 'Run with the highest privileges'. <br/>
<br> Head over to the 'Triggers' tab and add a new trigger that starts at log on.  Delay the task for 5 seconds and tick the 'Enabled' Box. Leave every other box unticked. <br/>
<br> In the 'Actions' tab, add a new action to start a program.  In the 'Program/script:' box add this location: 
> *C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe* <br/>

<br> In the 'Add Arguments' box you will need to direct it to the location of your XTUapply.ps1 file.
> -file "C:\Users\Jack\Documents\XTUapply.ps1" <br/>

<br> Leave everything unticked in the 'Settings' and 'Conditions' tabs except for 'Allow task to be run on demand'. <br/>
<br> If you have followed all of these steps you can now reboot. You should see the powershell window open on boot and it will disapear after applying your chosen profile. <br/>
