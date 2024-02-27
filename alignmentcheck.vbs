'*******************************************************
'Alignment Check VBScript
'by Warren Byle
'warren_byle@dell.com
'04/20/2011
'use at your own risk, as is, no warranties
'*******************************************************

strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colItems = objWMIService.ExecQuery("Select * from Win32_DiskPartition")

For Each objItem in ColItems
offset = (objitem.startingoffset / 4096)
If Clng(offset) = offset then
wscript.echo  objitem.DeviceID & " is aligned - " & objitem.startingoffset
Else
wscript.echo  objitem.DeviceID & " is NOT aligned - " & objitem.startingoffset
End If
Next