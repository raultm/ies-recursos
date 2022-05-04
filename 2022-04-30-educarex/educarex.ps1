#
#    educarex - Installs EAP-GTC & Configure educarex wifi
#
#    Authors: Raul Tierno <raultm@gmail.com>
#
#    Install from internet:
#    Set-ExecutionPolicy Unrestricted -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/raultm/ies-recursos/main/2022-04-30-educarex/educarex.ps1'))
#

function Install-EAPGTC
{
	$name='EAP GTC x64' 
	$url="https://github.com/raultm/ies-recursos/raw/main/2022-04-30-educarex/EAP-GTC-x64.msi" 
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
	$url="https://raw.githubusercontent.com/raultm/ies-recursos/main/2022-04-30-educarex/educarex.xml" 
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
Install-EAPGTC
Configure-Educarex
