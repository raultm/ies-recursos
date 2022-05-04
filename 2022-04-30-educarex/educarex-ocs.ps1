#
#    educarex-ocs - Set the computer Domain, installs OCS and register to server. 
#              	    Installs EAP-GTC & Configure educarex wifi
#
#    Authors: Raul Tierno <raultm@gmail.com>
#
#    Install from internet(need manual domain/server):
#    Set-ExecutionPolicy Unrestricted -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/raultm/ies-recursos/main/2022-04-30-educarex/educarex-ocs.ps1'))
#
#    Mass Installation? Recommended install from servidor(need configure domain/server/filesPath in server)
#    Set-ExecutionPolicy Unrestricted -Force; iex ((New-Object System.Net.WebClient).DownloadString('http://servidor/educarex/educarex-ocs.ps1'))
#


param(
    $domain = "",
    $ocsserver = "",
    $filesPath = "https://github.com/raultm/ies-recursos/raw/main/2022-04-30-educarex/"
)

IF ("" -eq $domain){ $domain = Read-Host "Nombre del Dominio" }
IF ("" -eq $ocsserver){ $ocsserver = Read-Host "Servidor de OCS Inventory a registrar" }



Write-Host "Domain: $domain"
Write-Host "OCS Server: $ocsserver"
Write-Host "Resource PATH: $filesPath"


function Install-OCS
{
	$name='OCS Agent' 
	$url="$filesPath/OCS-Windows-Agent-Setup-x64.exe" 
	$path="C:\ies\OCS-Windows-Agent-Setup-x64.exe"
        $hostname=hostname
        $workgroup=(Get-WmiObject -Class Win32_ComputerSystem).Domain
	""
	"  Proceso de descarga e instalacion de $name"
    IF (Test-Path $path) {
      '    Descarga no necesaria'
    } ELSE {
      "    Descargando $name..."
      Invoke-WebRequest $url -Outfile $path
      "    Descarga Finalizada"
    }
    
    IF ($workgroup -eq $domain){
      "    Ordenador ya esta en el dominio $domain (workgroup $workgroup)"
    } ELSE {
      "    Cambiando dominio a $domain"
      Add-Computer -WorkGroupName $domain
    }

    "    Instalando $name y registrando ordenador '$hostname' en '$ocsserver'..."
    $cmd = "$path \/server=$ocsserver \/nosoftware /tag='Windows' /now /ssl=0 /S /NOW"
    Invoke-Expression $cmd
    "    Instalacion $name Finalizada."
}


function Install-EAPGTC
{
	$name='EAP GTC x64' 
	$url="$filesPath/EAP-GTC-x64.msi" 
	$path="C:\ies\EAP-GTC-x64.msi"

	""
	"  Proceso de descarga e instalacion de $name"
    IF (Test-Path $path) {
      '    Descarga no necesaria'
    } ELSE {
      "    Descargando $name..."
      Invoke-WebRequest $url -Outfile $path
      "    Descarga Finalizada"
    }
    "    Instalando $name..."
    Start-Process $path -ArgumentList '/quiet /norestart' -Wait
    "    Instalacion $name Finalizada."
}

function Configure-Educarex
{
  $name='Configuracion Educarex' 
	$url="$filesPath/educarex.xml" 
	$path="C:\ies\educarex.xml"

	""
	"  Proceso de descarga e instalacion de $name"
    IF (Test-Path $path) {
      '    Descarga no necesaria'
    } ELSE {
      "    Descargando $name..."
      Invoke-WebRequest $url -Outfile $path
      "    Descarga Finalizada"
    }
    "    $name en proceso..."
    Netsh WLAN add profile filename=$path
    "    $name Finalizada."
}

New-Item -ItemType directory -Force -Path C:\ies | Out-Null
Install-OCS
Install-EAPGTC
Configure-Educarex