# Registro de OCS y Configuración de Red Educarex en ordenadores Windows 10 

Automatización del proceso de configuración de la red Educarex siguiendo el proceso explicado en el [blog Alfonso Pastor](http://2tazasdelinux.blogspot.com/2020/10/configuracion-de-red-wifi-educarex-en.html)

## ¿Qué hace el script?
- Por defecto si no recibe parámetros pregunta por
  - Dominio al que tiene que pertenecer
  - Servidor Puppet donde se quiere registrar
- Descarga el instalador de OCS y lo instala
- Descarga EAP-GTC x64 e instala
- Configura la red educarex

## 1. Desde Powershell

1. Abre un terminal de Powershell con Permisos de Administrador
2. Ejecutar el siguiente comando

``` ps1
Set-ExecutionPolicy Unrestricted -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/raultm/ies-recursos/main/2022-04-30-educarex/educarex-ocs.ps1'))
```

## 2. Usar Acceso Directo
Método si quiere configurar muchos ordenadores a la vez, lo metes en un pen drive y vas pasando

### 2.1 - Uso de los ficheros en Github
1. Descargate el fichero de [Acceso Directo Github](https://github.com/raultm/ies-recursos/raw/main/2022-04-30-educarex/Educarex%20OCS%20Github.lnk)
2. Ejecuta ese archivo donde quieras configurar la red

### 2.2 - Si quieres evitar poner en cada ordenador dominio/puppet Configura en Servidor

1. Pones los archivos de esta carpeta `2022-04-30-educarex` en el servidor `/var/www/html/educarex` y editas `educarex-ocs.ps1`
2. Descargate el fichero de [Acceso Directo Servidor](https://github.com/raultm/ies-recursos/raw/main/2022-04-30-educarex/Educarex%20OCS%20Servidor.lnk)
3. Ejecuta ese archivo donde quieras configurar la red

### 2.3 - Si quieres hacer el proceso sin tener que conectar previamente Usa Pendrive

1. Pones los archivos de esta carpeta `2022-04-30-educarex` en el PenDrive `/var/www/html/educarex` y editas `educarex-ocs.ps1`
2. Descargate el fichero de [Acceso Directo USB E](https://github.com/raultm/ies-recursos/raw/main/2022-04-30-educarex/Educarex%20OCS%20USB%20E.lnk)
3. Este Acceso Directo funciona si el pendrive se monta en `E:`, si no es así tendrás que modificar la unidad en el propio Acceso Directo
