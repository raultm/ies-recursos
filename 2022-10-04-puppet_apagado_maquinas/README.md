# puppet_apagado_maquinas

Es un paquete puppet que añade líneas al crontab de los dispositivos para su apagado

En los institutos solemos tener unas horas muy concretas de uso, nos viene bien para evitar un uso continuado no necesario y para no malgastar energía.

## Casos de Uso
- Apagar ordenadores que no va a ser usados fuera de un horario concreto

## Uso

### Descargar y Descomprimir
Descargar el zip y descomprimir

```
wget https://github.com/raultm/ies-recursos/releases/download/apagado_maquinas_1.0.1/puppet_apagado_maquinas.zip

unzip  puppet_apagador_maquinas.zip
```

### Ajustar la hora de apagado
Las horas de apagado están puestas a las 15:00 de la tarde y a las 23:00 de la noche, este segundo caso sobre todo para aquellos que tienen clases de tarde.

Si las 15:00 se queda corto por cualquier razón tan solo es modificar la hora o el minuto del apagado.

```
class puppet_apagado_maquinas {

#Apagado de máquinas por la mediodía.
    cron { apagado-mediodia:
      command => "/sbin/shutdown -h now",
      user => root,
      hour => 15,
      minute => 00,
      ensure => present,
    }

#Apagado de máquinas por la noche
  cron {  apagado-noche:
    command => "/sbin/shutdown -h now",
    user => root,
    hour => 23,
    minute => 00,
    ensure => present,
	}
}

```

### Pasamos el modulo a nuestra carpeta de módulos del servidor

Copiar la carpeta `puppet_apagado_maquinas` en la carpeta de nuestro servidor puppet `/etc/puppet/modules`

```
scp -r ./puppet_apagado_maquinas root@servidor:/etc/puppet/modules/
```


### Añadir a la clase/clases que queramos

Añadir el módulo en donde queramos, si queremos añadirlo a todos los equipos con xubuntu18 tendríamos que añadir en el archivo `/etc/puppet/manifests/classes/xubuntu1804/especifica-xubuntu-linex-2018.pp` la línea

```
include puppet_apagado_maquinas
```

La próxima vez que los clientes hagan puppet ya tendran todo configurado. 

Si quieres comprobarlo en un ordenador concreto puede hacerlo ejecutando

```
puppet agent -tv
```

Tras realizar la colección de acciones deberías poder ver en el crontab las líneas añadidas con

```
crontab -e
```

## ¿Qué hace el paquete?

Añade dos líneas en el crontab de los dispositivos para que se apaguen automáticamente


