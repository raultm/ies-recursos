# Alertas Servidor y Servicios

Como Sysadmin nos interesa tener monitorizados algunos aspectos de nuestros servidores. En algunas ocasiones tenemos algunos scripts que nos alertan cuando se superan algunos umbrales concretos, al final vamos coleccionando algunos de estos scripts pero he detectado que tienen un par de problemas.

- Al ir poniendolos de manera aleatoria no tienen una estructura común
- Están desperdigados por diferentes carpetas, en diferentes tareas cron, servicios como monit
- Una vez ha entrado el sistema en un estado que nos interesa conocer estos scripts customizados nos alertan sin parar. (Servicio caído, disco por encima del 70%). No queremos recibir alertas cada 5 minutos sino que nos avise otra vez cuando haya bajado el uso de 70% para saber que ha vuelto a valores normales

Objetivos de este repo

- Centralizar todos los scripts
- Único punto de notificaciones. 
  - Unificar el formato de notificaciones
  - Multicanal (logs, mail, telegram, etc)
- Reducir el número de avisos. Alertar sólo en los cambios de estado

# Uso

Descargar el zip y descomprimir

```
wget https://github.com/raultm/ies-recursos/releases/download/alertas_1.0.0/Alertas.zip

unzip  Alertas.zip
```
Copiar la carpeta `Alertas` al servidor

Por motivos legados tenemos esta carpeta en `/root/utilidades/scripts`, si tiene la misma estructura puedes copiar directamente

```
scp ./Alertas root@servidor:/root/utilidades/scripts/
```

Si prefieres tenerlo en otra carpeta tendrás que modificar las referencias a los comandos.

```
grep -rl "/root/utilidades/scripts/" . | xargs sed -i 's/\/root\/utilidades\/scripts\//\/path\/to\/route\//g'
```

Modificando **\/path\/to\/route\/** por la ruta donde lo hayas puesto tu.

# Estructura

- **checks.d**: Carpeta donde pondremos las cosas que queremos monitorizar
- **flags**: Para poder mandar notificaciones sólo en los cambios de estado necesitamos saber si estaba notificada la alerta o no. Aquí se crearán y destruirán archivos con este propósito. En principio vacío.
- **triggerchecks**: Ejecuta todos los archivos **ejecutables** que haya en la carpeta `checks.d`
- **checkthreshold**: Recibe 5 parámetros
  - **Nombre identificativo** de lo que monitorizamos: *cpu, ram, load*
  - **Valor umbral**: A partir de cuando queremos ser notificados
  - **Tipo**: Si queremos que compruebe que pasa por arriba o por abajo el valor umbral. > o < (Queremos que nos avise cuando el porcentaje del disco SUPERE un porcentaje, pero queremos que nos avise cuando el tóner BAJE del umbral concreto )
  - **Valor actual**: El valor concreto en el momento de ejecutar el comando
  - **Canal**: Podemos querer avisar a ciertos perfiles, si tenemos varios podemos indicar a quien queremos mandar el aviso de esta feature concreta
- **checkfeature**: Se mantiene por compatibilidad, pero ahora es un alias de checkfeatureabove
- **checkfeatureabove**: Recibe *identificador*, *umbral*, *valor* y *canal*. Comprueba si el valor está por encima del umbral. Llamada a checkthreshold.
- **checkfeaturebelow**: Recibe *identificador*, *umbral*, *valor* y *canal*. Comprueba si el valor está por debajo del umbral. Llamada a checkthreshold.
- **checkprinter**: Recibe *identificador*, *umbral*, *valor* y *canal*. Llama a **checkfeaturebelow** pero usando el canal de Secretaria.
- **notification**: Comando que centraliza las notificaciones: *mail, logger, telegram*. Aparte del mensaje puede recibir un segundo parámetro indicando el canal al que hay que avisar.
- **cron**: Comando que ha de añadirse al cron de nuestro servidor. En principio sólo llama a `triggerchecks` pero está abierto a añadir comandos antes y despues.

TIPO=$1
UMBRAL=$2
TYPE=$3
ACTUAL=$4
NOTIFICATIONCHANNEL=$5

# Checks de ejemplo
He dejado varios checks de ejemplo para poder ver la funcionalidad

- **ip-example**: Hace ping a 1.1.1.1
- **server-disk**: Comprueba si el porcentaje de uso de disco por encima de cierto umbral
- **server-load**: Comprueba si el 2º load están por encima de cierto umbral
- **server-ram**: Comprueba si el uso de RAM está por encima de cierto umbral

# Habilitar/Deshabilitar check

**`triggerchecks`** usa el comando `run-parts` que ejecuta solo aquellos archivos que tienen permisos de ejecución (cuidado de no crear checks con espacios en su nombre, en este caso había que modificar parámetros de este comando).

Si queremos deshabilitar un comando concreto, le quitamos permisos de ejecución

```
chmod -x checks.d/server-load
```

Si queremos activarlo de nuevo

```
chmod +x checks.d/server-load
```
