TITLE Windows Online Account Bypasser - By Henk.Tech
: This script should be run after a new installation, use Ctrl + Shift + F3 to bypass the login screen
: Close the System Preperation Tool afterwards, do not click ok and instead run this script to get the system back in a normal state

@echo off
taskkill /f /im sysprep.exe
cls

echo Enter your desired Username (You will be able to set a password with Ctrl + Alt + Del after the reboot)
set /p user=Username : 
echo %user%
net user %user% /add
net localgroup administrators %user% /add
WMIC USERACCOUNT WHERE Name='%user%' SET PasswordExpires=FALSE
echo PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPHVuYXR0ZW5kIHhtbG5zPSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOnVuYXR0ZW5kIj4KICAgIDxzZXR0aW5ncyBwYXNzPSJvb2JlU3lzdGVtIj4KICAgICAgICA8Y29tcG9uZW50IG5hbWU9Ik1pY3Jvc29mdC1XaW5kb3dzLVNoZWxsLVNldHVwIiBwcm9jZXNzb3JBcmNoaXRlY3R1cmU9ImFtZDY0IiBwdWJsaWNLZXlUb2tlbj0iMzFiZjM4NTZhZDM2NGUzNSIgbGFuZ3VhZ2U9Im5ldXRyYWwiIHZlcnNpb25TY29wZT0ibm9uU3hTIiB4bWxuczp3Y209Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vV01JQ29uZmlnLzIwMDIvU3RhdGUiIHhtbG5zOnhzaT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS9YTUxTY2hlbWEtaW5zdGFuY2UiPgogICAgICAgICAgICA8T09CRT4KICAgICAgICAgICAgICAgIDxIaWRlRVVMQVBhZ2U+dHJ1ZTwvSGlkZUVVTEFQYWdlPgogICAgICAgICAgICAgICAgPEhpZGVPRU1SZWdpc3RyYXRpb25TY3JlZW4+dHJ1ZTwvSGlkZU9FTVJlZ2lzdHJhdGlvblNjcmVlbj4KICAgICAgICAgICAgICAgIDxIaWRlT25saW5lQWNjb3VudFNjcmVlbnM+dHJ1ZTwvSGlkZU9ubGluZUFjY291bnRTY3JlZW5zPgogICAgICAgICAgICAgICAgPFNraXBNYWNoaW5lT09CRT50cnVlPC9Ta2lwTWFjaGluZU9PQkU+CiAgICAgICAgICAgICAgICA8U2tpcFVzZXJPT0JFPmZhbHNlPC9Ta2lwVXNlck9PQkU+CiAgICAgICAgICAgIDwvT09CRT4KICAgICAgICA8L2NvbXBvbmVudD4KICAgIDwvc2V0dGluZ3M+CjwvdW5hdHRlbmQ+ > %temp%\sysprep.tmp
certutil -decode %temp%\sysprep.tmp C:\programdata\sysprep.xml
C:\Windows\System32\sysprep\sysprep.exe /oobe /reboot /unattend:C:\programdata\sysprep.xml
pause
