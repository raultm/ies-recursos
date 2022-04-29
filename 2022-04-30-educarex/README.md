# Configuración de Red Educarex en ordenadores Windows 10

Automatización del proceso de configuración de la red Educarex siguiendo el proceso explicado en el [blog Alfonso Pastor](http://2tazasdelinux.blogspot.com/2020/10/configuracion-de-red-wifi-educarex-en.html)

[Manual Paso a Paso](http://cprmerida.juntaextremadura.net/images/stories/documentos/conexion-wifi-windows10-educarex.pdf)


## ¿Qué hace el script?
Descarga el instalador de EAP-GTC x64 y el archivo de configuración educarex.xml

1. Instala el paquete EAP-GTC
2. Aplica la configuración del archivo de educarex.xml
3. Al conectar a la red de educarex te pide usuario/contraseña de rayuela


## 1. Desde Powershell

1. Abre un terminal de Powershell con Permisos de Administrador
2. Ejecutar el siguiente comando

``` ps1
Set-ExecutionPolicy Unrestricted -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/raultm/ies-recursos/main/2022-04-30-educarex/educarex.ps1'))
```

## 2. Usar Acceso Directo
Método si quiere configurar muchos ordenadores a la vez, lo metes en un pen drive y vas pasando

1. Descargate el fichero de [Acceso Directo](https://github.com/raultm/ies-recursos/raw/main/2022-04-30-educarex/Educarex.lnk)
2. Ejecuta ese archivo donde quieras configurar la red
