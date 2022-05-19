# Puppet_loggers

Es un paquete puppet que registra las temperaturas de diferentes componentes de los equipos.

- MotherBoard
- CPU
- GPU
- HDD

va registrando los valores cada 10 minutos en el `/var/log/syslog` así ante cualquier reporte de incidencia se pueden consultar los historicos para comprobar si algun componente estaba funcionando mal.

Comandos copiados en gran parte del artículo de Alfonso Pastor [Monitorizando los puestos del aula con monit (II)](http://2tazasdelinux.blogspot.com/2019/04/monitorizando-los-puestos-del-aula-con_25.html)

## Uso

Copiar la carpeta `puppet_loggers` en la carpeta de nuestro servidor puppet `/etc/puppet/modules`

Si estas en la carpeta descargada puedes hacerlo con el siguiente comando

```
scp -r ./puppet_loggers root@servidor:/etc/puppet/modules/
```

Añadir el módulo en donde queramos, si queremos añadirlo a todos los equipos con xubuntu18 tendríamos que añadir en el archivo `/etc/puppet/manifests/classes/xubuntu1804/especifica-xubuntu-linex-2018.pp` la línea

```
include puppet_loggers
```

La próxima vez que los clientes hagan puppet ya tendran todo configurado.

## ¿Qué hace el paquete?


### Comandos

El paquete añade ciertos comandos en `/usr/local/sbin`

<dl>
  <dt><strong>temp-log</strong></dt>
  <dd>Lo usan los demás comando, sirve para meter los mensajes en el fichero de log con la misma estructura</dd>
  <dt><strong>temp-viewlogs</strong></dt>
  <dd>Para una rapida visualización de los registros. Admite un parámetro [MotherBoard|VGA|Hard Drive|CPU]</dd>
  <dt><strong>temp-mb</strong></dt>
  <dd>Temperatura de la Placa Base</dd>
  <dt><strong>temp-hdd</strong></dt>
  <dd>Temperatura del Disco Duro</dd>
  <dt><strong>temp-vga</strong></dt>
  <dd>Temperatura de la Placa de Video</dd>
  <dt><strong>temp-cpu</strong></dt>
  <dd>Temperatura de la CPU</dd>
</dl>

### Cron

Los 4 monitores los añade al cron para ejecutarlos cada 10 minutos.`*/10` si te interesa aumentar o disminuir su frecuencia puedes modificarlo en el `init.pp`
