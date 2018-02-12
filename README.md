# Shutdown Script

2 Scripts to shutdown worksations or servers

create two planned jobs:

job 1: restart if no user is active
		- NT-Authority\SYSTEM
		- shutdown_without_user.bat

job 2: resart with user active
		- after job 1
		- Predefinded\User
		- start.cmd