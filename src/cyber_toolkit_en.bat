@echo off
title GON Cybersecurity Toolkit - Developed by @Yankkj

color 04

set "github_username=Yankkj"
set "discord_username=imundar"
set "telegram_username=@feicoes"

set "LOG_DIR=%~dp0logs"

:splash_screen
cls
echo "======================================================"
echo "  [ GON Cybersecurity Toolkit ]"
echo "======================================================"
echo.
echo "   Welcome to your Cybersecurity Toolkit."
echo "   Essential tools for analysis and security."
echo.
echo "   Press any key to start..."
pause > nul
goto main_menu

:main_menu
cls
echo "======================================================"
echo "  [ GON Cybersecurity Toolkit ] - Main Menu"
echo "======================================================"
echo.
echo "1.  Network Reconnaissance and Analysis"
echo "2.  System Analysis and Basic Forensics"
echo "3.  Security Monitoring"
echo "4.  Firewall Management"
echo "5.  About the Toolkit"
echo "6.  Exit"
echo.
set /p "choice=Choose an option (1-6): "

if "%choice%"=="1" goto network_recon_menu
if "%choice%"=="2" goto system_analysis_menu
if "%choice%"=="3" goto security_monitor_menu
if "%choice%"=="4" goto firewall_menu
if "%choice%"=="5" goto about_menu
if "%choice%"=="6" goto exit_program
echo.
echo "Invalid option. Please enter a number between 1 and 6."
echo.
pause > nul
goto main_menu

:network_recon_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 1. Network Reconnaissance and Analysis"
echo "======================================================"
echo.
echo "Choose a tool for network analysis:"
echo.
echo "a.  Test Connectivity (Ping)"
echo "b.  Trace Route (Tracert)"
echo "c.  Query DNS (Nslookup)"
echo "d.  View Shared Resources (Net View)"
echo "e.  View ARP Cache (ARP -a)"
echo "f.  List Active Connections (Netstat -ano)"
echo "g.  Full Network Information (Ipconfig /all)"
echo "h.  Back to Main Menu"
echo.
set /p "sub_choice=Your choice: "

if /i "%sub_choice%"=="a" goto ping_option
if /i "%sub_choice%"=="b" goto tracert_option
if /i "%sub_choice%"=="c" goto nslookup_option
if /i "%sub_choice%"=="d" goto netview_option
if /i "%sub_choice%"=="e" goto arp_option
if /i "%sub_choice%"=="f" goto netstat_active_option
if /i "%sub_choice%"=="g" goto ipconfig_all_option
if /i "%sub_choice%"=="h" goto main_menu

echo.
echo "Invalid option. Please enter a valid letter (a-h)."
echo.
pause > nul
goto network_recon_menu

:ping_option
set /p "host_target=Enter IP/Hostname to ping: "
echo.
ping %host_target%
if errorlevel 1 (echo "Error: Could not execute ping. Check host and your connection.")
call :ask_to_save "ping_%host_target%.log" "ping %host_target%"
pause > nul
goto network_recon_menu

:tracert_option
set /p "host_target=Enter IP/Hostname for tracert: "
echo.
tracert %host_target%
if errorlevel 1 (echo "Error: Could not trace route. Check host.")
call :ask_to_save "tracert_%host_target%.log" "tracert %host_target%"
pause > nul
goto network_recon_menu

:nslookup_option
set /p "domain_target=Enter Domain for nslookup: "
echo.
nslookup %domain_target%
if errorlevel 1 (echo "Error: Could not query DNS. Check domain.")
call :ask_to_save "nslookup_%domain_target%.log" "nslookup %domain_target%"
pause > nul
goto network_recon_menu

:netview_option
echo.
echo "Listing shared network resources (may take a moment)..."
net view
if errorlevel 1 (echo "Error: Could not list resources. Check permissions or network connectivity.")
call :ask_to_save "net_view.log" "net view"
pause > nul
goto network_recon_menu

:arp_option
echo.
echo "Displaying ARP cache..."
arp -a
if errorlevel 1 (echo "Error: Could not display ARP cache. Check permissions.")
call :ask_to_save "arp_cache.log" "arp -a"
pause > nul
goto network_recon_menu

:netstat_active_option
echo.
echo "Listing all active connections and open ports (scroll up to see all)..."
netstat -ano
if errorlevel 1 (echo "Error: Could not list connections. Check permissions.")
call :ask_to_save "netstat_active.log" "netstat -ano"
pause > nul
goto network_recon_menu

:ipconfig_all_option
echo.
echo "Displaying full network configuration information (scroll up to see all)..."
ipconfig /all
if errorlevel 1 (echo "Error: Could not display network information.")
call :ask_to_save "ipconfig_all.log" "ipconfig /all"
pause > nul
goto network_recon_menu

:system_analysis_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 2. System Analysis and Basic Forensics"
echo "======================================================"
echo.
echo "Choose a tool to inspect the system:"
echo.
echo "a.  List Running Processes (Tasklist)"
echo "b.  Detailed Process Info (WMIC)"
echo "c.  Full System Info (Systeminfo)"
echo "d.  List Installed Drivers (Driverquery)"
echo "e.  List System Services (SC Query)"
echo "f.  List Local Users (Net Users)"
echo "g.  List Local Groups (Net Localgroup)"
echo "h.  Back to Main Menu"
echo.
set /p "sub_choice=Your choice: "

if /i "%sub_choice%"=="a" goto tasklist_option
if /i "%sub_choice%"=="b" goto wmic_process_option
if /i "%sub_choice%"=="c" goto systeminfo_option
if /i "%sub_choice%"=="d" goto driverquery_option
if /i "%sub_choice%"=="e" goto sc_query_option
if /i "%sub_choice%"=="f" goto net_users_option
if /i "%sub_choice%"=="g" goto net_localgroup_option
if /i "%sub_choice%"=="h" goto main_menu

echo.
echo "Invalid option. Please enter a valid letter (a-h)."
echo.
pause > nul
goto system_analysis_menu

:tasklist_option
echo.
echo "Listing running processes..."
tasklist
if errorlevel 1 (echo "Error: Could not list processes. Check permissions.")
call :ask_to_save "tasklist.log" "tasklist"
pause > nul
goto system_analysis_menu

:wmic_process_option
echo.
echo "Getting detailed process information (may take a moment)..."
wmic process get description,executablepath,commandline /format:list
if errorlevel 1 (echo "Error: Could not get process details.")
call :ask_to_save "wmic_processes.log" "wmic process get description,executablepath,commandline"
pause > nul
goto system_analysis_menu

:systeminfo_option
echo.
echo "Collecting full system information (scroll up to see all)..."
systeminfo
if errorlevel 1 (echo "Error: Could not get system information.")
call :ask_to_save "systeminfo.log" "systeminfo"
pause > nul
goto system_analysis_menu

:driverquery_option
echo.
echo "Listing installed drivers..."
driverquery
if errorlevel 1 (echo "Error: Could not list drivers.")
call :ask_to_save "driverquery.log" "driverquery"
pause > nul
goto system_analysis_menu

:sc_query_option
echo.
echo "Listing system services..."
sc query
if errorlevel 1 (echo "Error: Could not list services. Check permissions.")
call :ask_to_save "sc_query.log" "sc query"
pause > nul
goto system_analysis_menu

:net_users_option
echo.
echo "Listing local user accounts..."
net users
if errorlevel 1 (echo "Error: Could not list users.")
call :ask_to_save "net_users.log" "net users"
pause > nul
goto system_analysis_menu

:net_localgroup_option
echo.
echo "Listing local user groups..."
net localgroup
if errorlevel 1 (echo "Error: Could not list local groups.")
call :ask_to_save "net_localgroup.log" "net localgroup"
pause > nul
goto system_analysis_menu

:security_monitor_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 3. Security Monitoring"
echo "======================================================"
echo.
echo "Choose a monitoring option:"
echo.
echo "a.  Monitor Active Connections (5s Refresh)"
echo "b.  List Scheduled Tasks (Schtasks)"
echo "c.  Check Recent Logon Events"
echo "d.  Back to Main Menu"
echo.
set /p "sub_choice=Your choice: "

if /i "%sub_choice%"=="a" goto monitor_netstat_loop
if /i "%sub_choice%"=="b" goto schtasks_query_option
if /i "%sub_choice%"=="c" goto recent_logon_events_option
if /i "%sub_choice%"=="d" goto main_menu

echo.
echo "Invalid option. Please enter a valid letter (a-d)."
echo.
pause > nul
goto security_monitor_menu

:monitor_netstat_loop
echo.
echo "STARTING ACTIVE CONNECTIONS MONITORING..."
echo "Press CTRL+C at any time to STOP and return to menu."
echo.
timeout /t 3 /nobreak > nul
:netstat_loop_start
cls
echo "======================================================"
echo "  [ GON Toolkit ] - Active Connections Monitoring"
echo "======================================================"
echo.
echo "(Updating every 5 seconds. Press CTRL+C to exit)"
echo.
netstat -ano
if errorlevel 1 (
    echo "Error: Could not monitor connections. Check permissions."
    pause > nul
    goto security_monitor_menu
)
timeout /t 5 /nobreak > nul
goto netstat_loop_start

:schtasks_query_option
echo.
echo "Listing scheduled tasks (scroll up to see all)..."
schtasks /query /fo LIST /v
if errorlevel 1 (echo "Error: Could not list scheduled tasks. Check permissions.")
call :ask_to_save "scheduled_tasks.log" "schtasks /query /fo LIST /v"
pause > nul
goto security_monitor_menu

:recent_logon_events_option
echo.
echo "Getting last 20 logon and logon failure events (IDs 4624, 4625)..."
echo.
wevtutil qe Security "/q:*[System[(EventID=4624 or EventID=4625)]]" /c:20 /f:text
if errorlevel 1 (echo "Error: Could not retrieve logon events. Check permissions.")
call :ask_to_save "recent_logon_events.log" "wevtutil qe Security /q:*[System[(EventID=4624 or EventID=4625)]] /c:20 /f:text"
pause > nul
goto security_monitor_menu

:firewall_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 4. Firewall Management"
echo "======================================================"
echo.
echo "Control and view Windows Firewall rules:"
echo.
echo "a.  List All Firewall Rules"
echo "b.  Add New Blocking Rule (by Port)"
echo "c.  Remove Firewall Rule by Name"
echo "d.  Back to Main Menu"
echo.
set /p "sub_choice=Your choice: "

if /i "%sub_choice%"=="a" goto list_firewall_rules
if /i "%sub_choice%"=="b" goto add_firewall_rule
if /i "%sub_choice%"=="c" goto remove_firewall_rule
if /i "%sub_choice%"=="d" goto main_menu

echo.
echo "Invalid option. Please enter a valid letter (a-d)."
echo.
pause > nul
goto firewall_menu

:list_firewall_rules
echo.
echo "Listing all Windows Firewall rules (may take a moment)..."
netsh advfirewall firewall show rule name=all
if errorlevel 1 (echo "Error: Could not list rules. Ensure you are running as Administrator.")
call :ask_to_save "firewall_rules.log" "netsh advfirewall firewall show rule name=all"
pause > nul
goto firewall_menu

:add_firewall_rule
echo.
echo "ADD NEW BLOCKING RULE"
echo "------------------------------------------------------"
set /p "rule_name=Enter a name for the new rule: "
set /p "port_num=Enter the port number to block (Ex: 80, 443, 3389): "
set /p "protocol_type=Enter the protocol (TCP or UDP): "
echo.
set /p "confirm=Confirm adding rule '%rule_name%' to block port %port_num% (%protocol_type%)? (Y/N): "
if /i "%confirm%"=="y" (
    netsh advfirewall firewall add rule name="%rule_name%_Out" dir=out action=block protocol="%protocol_type%" localport="%port_num%" enable=yes > nul 2>&1
    netsh advfirewall firewall add rule name="%rule_name%_In" dir=in action=block protocol="%protocol_type%" localport="%port_num%" enable=yes > nul 2>&1
    echo.
    if "%ERRORLEVEL%"=="0" (
        echo "Success: Firewall rules for '%rule_name%' created!"
        echo "Port %port_num% (%protocol_type%) is now blocked (inbound and outbound)."
    ) else (
        echo "Error: Could not create rules. Check inputs and ensure you are running as Administrator."
    )
) else (
    echo.
    echo "Rule addition operation cancelled."
)
pause > nul
goto firewall_menu

:remove_firewall_rule
echo.
echo "REMOVE EXISTING BLOCKING RULE"
echo "------------------------------------------------------"
set /p "rule_to_remove=Enter the FULL name of the rule to remove: "
echo.
set /p "confirm=Confirm removing rule '%rule_to_remove%'? (Y/N): "
if /i "%confirm%"=="y" (
    netsh advfirewall firewall delete rule name="%rule_to_remove%" > nul 2>&1
    echo.
    if "%ERRORLEVEL%"=="0" (
        echo "Success: Rule '%rule_to_remove%' removed (if it existed)."
    ) else (
        echo "Error: Could not remove rule. Check the name and ensure you are running as Administrator."
    )
) else (
    echo.
    echo "Rule removal operation cancelled."
)
pause > nul
goto firewall_menu

:about_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 5. About the Toolkit"
echo "======================================================"
echo.
echo "This is a basic cybersecurity toolkit developed in CMD."
echo "It offers quick access to essential commands for reconnaissance,"
echo "system analysis, and security monitoring in the Windows environment."
echo.
echo "  Developed by: GON"
echo.
echo "  Contacts:"
echo "  --------------------------------------------------"
echo "  GitHub:    https://github.com/%github_username%"
echo "  Discord:   %discord_username%"
echo "  Telegram:  %telegram_username%"
echo "  --------------------------------------------------"
echo.
echo "Press any key to go back to Main Menu..."
pause > nul
goto main_menu

:ask_to_save
set "log_filename=%~1"
set "command_to_log=%~2"
echo.
set /p "save_log_choice=Do you want to save the output of this test to a log file? (Y/N): "
if /i "%save_log_choice%"=="y" (
    if not exist "%LOG_DIR%" mkdir "%LOG_DIR%" > nul
    for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set "current_date=%%c%%b%%a"
    for /f "tokens=1-2 delims=:" %%a in ('time /t') do set "current_time=%%a%%b"
    set "timestamp=%current_date%_%current_time%"
    
    set "temp_log_file=%TEMP%\%RANDOM%_gon_temp.log"
    %command_to_log% > "%temp_log_file%" 2>&1
    
    move "%temp_log_file%" "%LOG_DIR%\%timestamp%_%log_filename%" > nul
    
    echo.
    echo "Success: Output saved to: "%LOG_DIR%\%timestamp%_%log_filename%""
)
exit /b

:exit_program
cls
echo "======================================================"
echo "  [ GON Toolkit ] - Exiting"
echo "======================================================"
echo.
echo "Thank you for using the GON Cybersecurity Toolkit!"
echo.
timeout /t 2 > nul
exit