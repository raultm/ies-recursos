# Puppet_printers_reset

Es un paquete puppet que cancela los trabajos de impresoras en la máquina cuando alguien se loguea

Uno de los focos de incidencias más habituales es la Sala de Profesores y problemas con impresoras, en muchos casos hay trabajos que se quedan a medias y el usuario ni resuelve ni avisa. ¿Razones de que los trabajos se queden bloqueando la cola?

- Impresora se ha quedado sin toner
- Impresora se ha quedado sin papel
- Atasco de papel en la impresora
- Por alguna razón el programa usado para enviar el documento lo ha enviado mal

Desde que está puesta la tarea se han reducido al mínimo las incidencias

## Uso

### Tener accesible el módulo
Descargar el zip, descomprimir y  copiar la carpeta `puppet_printers_reset` en la carpeta de nuestro servidor puppet `/etc/puppet/modules`

```
wget https://github.com/raultm/ies-recursos/releases/download/printers_reset_1.0.0/puppet_printers_reset.zip

unzip  puppet_printers_reset.zip

scp -r ./puppet_printers_reset root@servidor:/etc/puppet/modules/
```

### Añadir a la clase/clases que queramos

Añadir el módulo en donde queramos, si queremos añadirlo a todos los equipos con xubuntu18 tendríamos que añadir en el archivo `/etc/puppet/manifests/classes/xubuntu1804/especifica-xubuntu-linex-2018.pp` la línea

```
include puppet_printers_reset
```

La próxima vez que los clientes hagan puppet ya tendran todo configurado.

## ¿Qué hace el paquete?

En profile.d tenemos una llamada al script `/usr/local/sbin/ies-printers`, con lo que cada vez que alguien hace login en GUI o Terminal se ejecuta.

Pero necesita permisos de root para llamar a `cancel`, por esto le indicamos en `sudoers.d` que cualquiera pueda llamar a ese comando con `sudo`


### Archivos

El paquete añade archivos en profile.d, sudoers.d y un comando local

<dl>
  <dt><strong>/etc/profile.d/ies-printers.sh</strong></dt>
  <dd>Llama a <i>sudo /usr/local/sbin/ies-printers</i> en todos los logins</dd>
  <dt><strong>/usr/local/sbin/ies-printers</strong></dt>
  <dd>Cancela todos los trabajos de todas las impresoras con <i>cancel -a</i></dd>
  <dt><strong>/etc/sudoers.d/printers</strong></dt>
  <dd>Indica que el anterior script es llamable con <b>sudo</b> sin contraseña por cualquier usuario</dd>
</dl>

