@echo off
title GON Cybersecurity Toolkit - Desenvolvido por @Yankkj

color 04

set "github_username=Yankkj"
set "discord_username=34sp"
set "telegram_username=@feicoes"

set "LOG_DIR=%~dp0logs"

:splash_screen
cls
echo "======================================================"
echo "  [ GON Cybersecurity Toolkit ]"
echo "======================================================"
echo.
echo "   Bem-vindo(a) ao seu Toolkit de Ciberseguranca."
echo "   Ferramentas essenciais para analise e seguranca."
echo.
echo "   Pressione qualquer tecla para iniciar..."
pause > nul
goto main_menu

:main_menu
cls
echo "======================================================"
echo "  [ GON Cybersecurity Toolkit ] - Menu Principal"
echo "======================================================"
echo.
echo "1.  Reconhecimento e Analise de Rede"
echo "2.  Analise de Sistema e Forense Basica"
echo "3.  Monitoramento de Seguranca"
echo "4.  Gerenciamento de Firewall"
echo "5.  Sobre o Toolkit"
echo "6.  Sair"
echo.
set /p "choice=Escolha uma opcao (1-6): "

if "%choice%"=="1" goto network_recon_menu
if "%choice%"=="2" goto system_analysis_menu
if "%choice%"=="3" goto security_monitor_menu
if "%choice%"=="4" goto firewall_menu
if "%choice%"=="5" goto about_menu
if "%choice%"=="6" goto exit_program
echo.
echo "Opcao invalida. Por favor, digite um numero entre 1 e 6."
echo.
pause > nul
goto main_menu

:network_recon_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 1. Reconhecimento e Analise de Rede"
echo "======================================================"
echo.
echo "Escolha uma ferramenta para analise de rede:"
echo.
echo "a.  Testar Conectividade (Ping)"
echo "b.  Tracar Rota (Tracert)"
echo "c.  Consultar DNS (Nslookup)"
echo "d.  Ver Recursos Compartilhados (Net View)"
echo "e.  Ver Cache ARP (ARP -a)"
echo "f.  Listar Conexoes Ativas (Netstat -ano)"
echo "g.  Informacoes Completas de Rede (Ipconfig /all)"
echo "h.  Voltar ao Menu Principal"
echo.
set /p "sub_choice=Sua escolha: "

if /i "%sub_choice%"=="a" goto ping_option
if /i "%sub_choice%"=="b" goto tracert_option
if /i "%sub_choice%"=="c" goto nslookup_option
if /i "%sub_choice%"=="d" goto netview_option
if /i "%sub_choice%"=="e" goto arp_option
if /i "%sub_choice%"=="f" goto netstat_active_option
if /i "%sub_choice%"=="g" goto ipconfig_all_option
if /i "%sub_choice%"=="h" goto main_menu

echo.
echo "Opcao invalida. Por favor, digite uma letra valida (a-h)."
echo.
pause > nul
goto network_recon_menu

:ping_option
set /p "host_target=Digite o IP/Hostname para ping: "
echo.
ping %host_target%
if errorlevel 1 (echo "Erro: Nao foi possivel executar o ping. Verifique o host e sua conexao.")
call :ask_to_save "ping_%host_target%.log" "ping %host_target%"
pause > nul
goto network_recon_menu

:tracert_option
set /p "host_target=Digite o IP/Hostname para tracert: "
echo.
tracert %host_target%
if errorlevel 1 (echo "Erro: Nao foi possivel tracar a rota. Verifique o host.")
call :ask_to_save "tracert_%host_target%.log" "tracert %host_target%"
pause > nul
goto network_recon_menu

:nslookup_option
set /p "domain_target=Digite o Dominio para nslookup: "
echo.
nslookup %domain_target%
if errorlevel 1 (echo "Erro: Nao foi possivel consultar o DNS. Verifique o dominio.")
call :ask_to_save "nslookup_%domain_target%.log" "nslookup %domain_target%"
pause > nul
goto network_recon_menu

:netview_option
echo.
echo "Listando recursos compartilhados na rede (pode demorar)..."
net view
if errorlevel 1 (echo "Erro: Nao foi possivel listar recursos. Verifique permissoes ou conectividade de rede.")
call :ask_to_save "net_view.log" "net view"
pause > nul
goto network_recon_menu

:arp_option
echo.
echo "Exibindo cache ARP..."
arp -a
if errorlevel 1 (echo "Erro: Nao foi possivel exibir o cache ARP. Verifique permissoes.")
call :ask_to_save "arp_cache.log" "arp -a"
pause > nul
goto network_recon_menu

:netstat_active_option
echo.
echo "Listando todas as conexoes ativas e portas abertas (role para cima para ver tudo)..."
netstat -ano
if errorlevel 1 (echo "Erro: Nao foi possivel listar conexoes. Verifique permissoes.")
call :ask_to_save "netstat_active.log" "netstat -ano"
pause > nul
goto network_recon_menu

:ipconfig_all_option
echo.
echo "Exibindo informacoes completas da configuracao de rede (role para cima para ver tudo)..."
ipconfig /all
if errorlevel 1 (echo "Erro: Nao foi possivel exibir informacoes de rede.")
call :ask_to_save "ipconfig_all.log" "ipconfig /all"
pause > nul
goto network_recon_menu

:system_analysis_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 2. Analise de Sistema e Forense Basica"
echo "======================================================"
echo.
echo "Escolha uma ferramenta para inspecionar o sistema:"
echo.
echo "a.  Listar Processos em Execucao (Tasklist)"
echo "b.  Info Detalhada de Processos (WMIC)"
echo "c.  Informacoes Completas do Sistema (Systeminfo)"
echo "d.  Listar Drivers Instalados (Driverquery)"
echo "e.  Listar Servicos do Sistema (SC Query)"
echo "f.  Listar Usuarios Locais (Net Users)"
echo "g.  Listar Grupos Locais (Net Localgroup)"
echo "h.  Voltar ao Menu Principal"
echo.
set /p "sub_choice=Sua escolha: "

if /i "%sub_choice%"=="a" goto tasklist_option
if /i "%sub_choice%"=="b" goto wmic_process_option
if /i "%sub_choice%"=="c" goto systeminfo_option
if /i "%sub_choice%"=="d" goto driverquery_option
if /i "%sub_choice%"=="e" goto sc_query_option
if /i "%sub_choice%"=="f" goto net_users_option
if /i "%sub_choice%"=="g" goto net_localgroup_option
if /i "%sub_choice%"=="h" goto main_menu

echo.
echo "Opcao invalida. Por favor, digite uma letra valida (a-h)."
echo.
pause > nul
goto system_analysis_menu

:tasklist_option
echo.
echo "Listando processos em execucao..."
tasklist
if errorlevel 1 (echo "Erro: Nao foi possivel listar processos. Verifique permissoes.")
call :ask_to_save "tasklist.log" "tasklist"
pause > nul
goto system_analysis_menu

:wmic_process_option
echo.
echo "Obtendo informacoes detalhadas de processos (pode demorar)..."
wmic process get description,executablepath,commandline /format:list
if errorlevel 1 (echo "Erro: Nao foi possivel obter detalhes de processos.")
call :ask_to_save "wmic_processes.log" "wmic process get description,executablepath,commandline"
pause > nul
goto system_analysis_menu

:systeminfo_option
echo.
echo "Coletando informacoes completas do sistema (role para cima para ver tudo)..."
systeminfo
if errorlevel 1 (echo "Erro: Nao foi possivel obter informacoes do sistema.")
call :ask_to_save "systeminfo.log" "systeminfo"
pause > nul
goto system_analysis_menu

:driverquery_option
echo.
echo "Listando drivers instalados..."
driverquery
if errorlevel 1 (echo "Erro: Nao foi possivel listar drivers.")
call :ask_to_save "driverquery.log" "driverquery"
pause > nul
goto system_analysis_menu

:sc_query_option
echo.
echo "Listando servicos do sistema..."
sc query
if errorlevel 1 (echo "Erro: Nao foi possivel listar servicos. Verifique permissoes.")
call :ask_to_save "sc_query.log" "sc query"
pause > nul
goto system_analysis_menu

:net_users_option
echo.
echo "Listando contas de usuarios locais..."
net users
if errorlevel 1 (echo "Erro: Nao foi possivel listar usuarios.")
call :ask_to_save "net_users.log" "net users"
pause > nul
goto system_analysis_menu

:net_localgroup_option
echo.
echo "Listando grupos locais de usuarios..."
net localgroup
if errorlevel 1 (echo "Erro: Nao foi possivel listar grupos locais.")
call :ask_to_save "net_localgroup.log" "net localgroup"
pause > nul
goto system_analysis_menu

:security_monitor_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 3. Monitoramento de Seguranca"
echo "======================================================"
echo.
echo "Escolha uma opcao para monitoramento:"
echo.
echo "a.  Monitorar Conexoes Ativas (Atualizacao a cada 5s)"
echo "b.  Listar Tarefas Agendadas (Schtasks)"
echo "c.  Verificar Eventos de Logon Recentes"
echo "d.  Voltar ao Menu Principal"
echo.
set /p "sub_choice=Sua escolha: "

if /i "%sub_choice%"=="a" goto monitor_netstat_loop
if /i "%sub_choice%"=="b" goto schtasks_query_option
if /i "%sub_choice%"=="c" goto recent_logon_events_option
if /i "%sub_choice%"=="d" goto main_menu

echo.
echo "Opcao invalida. Por favor, digite uma letra valida (a-d)."
echo.
pause > nul
goto security_monitor_menu

:monitor_netstat_loop
echo.
echo "INICIANDO MONITORAMENTO DE CONEXOES ATIVAS..."
echo "Pressione CTRL+C a qualquer momento para PARAR e voltar ao menu."
echo.
timeout /t 3 /nobreak > nul
:netstat_loop_start
cls
echo "======================================================"
echo "  [ GON Toolkit ] - Monitoramento de Conexoes Ativas"
echo "======================================================"
echo.
echo "(Atualizando a cada 5 segundos. Pressione CTRL+C para sair)"
echo.
netstat -ano
if errorlevel 1 (
    echo "Erro: Nao foi possivel monitorar conexoes. Verifique permissoes."
    pause > nul
    goto security_monitor_menu
)
timeout /t 5 /nobreak > nul
goto netstat_loop_start

:schtasks_query_option
echo.
echo "Listando tarefas agendadas (role para cima para ver tudo)..."
schtasks /query /fo LIST /v
if errorlevel 1 (echo "Erro: Nao foi possivel listar tarefas agendadas. Verifique permissoes.")
call :ask_to_save "scheduled_tasks.log" "schtasks /query /fo LIST /v"
pause > nul
goto security_monitor_menu

:recent_logon_events_option
echo.
echo "Obtendo os 20 ultimos eventos de logon e falha de logon (IDs 4624, 4625)..."
echo.
wevtutil qe Security "/q:*[System[(EventID=4624 or EventID=4625)]]" /c:20 /f:text
if errorlevel 1 (echo "Erro: Nao foi possivel obter eventos de logon. Verifique permissoes.")
call :ask_to_save "recent_logon_events.log" "wevtutil qe Security /q:*[System[(EventID=4624 or EventID=4625)]] /c:20 /f:text"
pause > nul
goto security_monitor_menu

:firewall_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 4. Gerenciamento de Firewall"
echo "======================================================"
echo.
echo "Controle e visualize as regras do Windows Firewall:"
echo.
echo "a.  Listar Todas as Regras de Firewall"
echo "b.  Adicionar Nova Regra de Bloqueio (por Porta)"
echo "c.  Remover Regra de Firewall por Nome"
echo "d.  Voltar ao Menu Principal"
echo.
set /p "sub_choice=Sua escolha: "

if /i "%sub_choice%"=="a" goto list_firewall_rules
if /i "%sub_choice%"=="b" goto add_firewall_rule
if /i "%sub_choice%"=="c" goto remove_firewall_rule
if /i "%sub_choice%"=="d" goto main_menu

echo.
echo "Opcao invalida. Por favor, digite uma letra valida (a-d)."
echo.
pause > nul
goto firewall_menu

:list_firewall_rules
echo.
echo "Listando todas as regras do Windows Firewall (pode demorar)..."
netsh advfirewall firewall show rule name=all
if errorlevel 1 (echo "Erro: Nao foi possivel listar regras. Verifique permissoes de Administrador.")
call :ask_to_save "firewall_rules.log" "netsh advfirewall firewall show rule name=all"
pause > nul
goto firewall_menu

:add_firewall_rule
echo.
echo "ADICIONAR NOVA REGRA DE BLOQUEIO"
echo "------------------------------------------------------"
set /p "rule_name=Digite um nome para a nova regra: "
set /p "port_num=Digite o numero da porta a bloquear (Ex: 80, 443, 3389): "
set /p "protocol_type=Digite o protocolo (TCP ou UDP): "
echo.
set /p "confirm=Confirma a adicao da regra '%rule_name%' para bloquear a porta %port_num% (%protocol_type%)? (S/N): "
if /i "%confirm%"=="s" (
    netsh advfirewall firewall add rule name="%rule_name%_Out" dir=out action=block protocol="%protocol_type%" localport="%port_num%" enable=yes > nul 2>&1
    netsh advfirewall firewall add rule name="%rule_name%_In" dir=in action=block protocol="%protocol_type%" localport="%port_num%" enable=yes > nul 2>&1
    echo.
    if "%ERRORLEVEL%"=="0" (
        echo "Sucesso: Regras de firewall para %rule_name% criadas!"
        echo "A porta %port_num% (%protocol_type%) esta bloqueada (entrada e saida)."
    ) else (
        echo "Erro: Nao foi possivel criar as regras. Verifique os dados inseridos e se esta executando como Administrador."
    )
) else (
    echo.
    echo "Operacao de adicao de regra cancelada."
)
pause > nul
goto firewall_menu

:remove_firewall_rule
echo.
echo "REMOVER REGRA DE BLOQUEIO EXISTENTE"
echo "------------------------------------------------------"
set /p "rule_to_remove=Digite o NOME COMPLETO da regra a remover: "
echo.
set /p "confirm=Confirma a remocao da regra '%rule_to_remove%'? (S/N): "
if /i "%confirm%"=="s" (
    netsh advfirewall firewall delete rule name="%rule_to_remove%" > nul 2>&1
    echo.
    if "%ERRORLEVEL%"=="0" (
        echo "Sucesso: Regra '%rule_to_remove%' removida (se existir)."
    ) else (
        echo "Erro: Nao foi possivel remover a regra. Verifique o nome e se esta executando como Administrador."
    )
) else (
    echo.
    echo "Operacao de remocao de regra cancelada."
)
pause > nul
goto firewall_menu

:about_menu
cls
echo "======================================================"
echo "  [ GON Toolkit ] - 5. Sobre o Toolkit"
echo "======================================================"
echo.
echo "Este e' um toolkit de ciberseguranca basico desenvolvido em CMD."
echo "Ele oferece acesso rapido a comandos essenciais para reconhecimento,"
echo "analise de sistema e monitoramento de seguranca no ambiente Windows."
echo.
echo "  Desenvolvido por: GON"
echo.
echo "  Contatos:"
echo "  --------------------------------------------------"
echo "  GitHub:    https://github.com/%github_username%"
echo "  Discord:   %discord_username%"
echo "  Telegram:  %telegram_username%"
echo "  --------------------------------------------------"
echo.
echo "Pressione qualquer tecla para voltar ao Menu Principal..."
pause > nul
goto main_menu

:ask_to_save
set "log_filename=%~1"
set "command_to_log=%~2"
echo.
set /p "save_log_choice=Deseja salvar a saida deste teste em um arquivo de log? (S/N): "
if /i "%save_log_choice%"=="s" (
    if not exist "%LOG_DIR%" mkdir "%LOG_DIR%" > nul
    for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set "current_date=%%c%%b%%a"
   
