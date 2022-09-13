# puppet_change_linex_password

Es un paquete puppet que cambia la contraseña del usuario linex en los equipos administrados

Las imágenes que nos aporta la sección vienen con dos usuarios root y linex, esta tarea esta destinada a cambiar la contraseña por defecto del usurio linex.

Tras realizar el puppet ya tienen la contraseña actualizada

## Casos de Uso
- Ordenadores nuevos. Evitar olvidos o errores.
- Quieres hacer un cambio general por motivos de mantenimiento
- Descubres que se ha filtrado de alguna manera la contraseña anterior. Da igual si alguien ha conseguido la anterior, para que no se cambie tendría que acceder y deshabilitar la acción de puppet

## Uso

### Descargar y Descomprimir
Descargar el zip y descomprimir

```
wget https://github.com/raultm/ies-recursos/releases/download/linex_password_1.0.0/puppet_change_linex_password.zip

unzip  puppet_change_linex_password.zip
```

### Generar Hash de la Contraseña
Vamos a poner la contraseña en el paquete pero, obviamente, no la vamos a poner en claro.

Ejecutamos en cualquier máquina el siguiente comando, cambiado PASSWORD por la contraseña que quiere usar.

```
mkpasswd -m sha-256 PASSWORD
```

Te dará una salida parecida a esta
```
$5$7oGRuxgTryqPpn6N$G4/ZyYkroGsEPoGdYjQQRw7C8mvacTk3RhlWuIF4fF9
```

y eso tienes que ponerlo en el campo password del archivo `manifest/init.pp` del módulo

```
class puppet_change_linex_password {

  user { linex: 
    ensure => present,
    shell => '/bin/bash',
    password => '$5$7oGRuxgTryqPpn6N$G4/ZyYkroGsEPoGdYjQQRw7C8mvacTk3RhlWuIF4fF9',
  }
}
```

### Pasamos el modulo a nuestra carpeta de módulos del servidor

Copiar la carpeta `puppet_change_linex_password` en la carpeta de nuestro servidor puppet `/etc/puppet/modules`

```
scp -r ./puppet_change_linex_password root@servidor:/etc/puppet/modules/
```


### Añadir a la clase/clases que queramos

Añadir el módulo en donde queramos, si queremos añadirlo a todos los equipos con xubuntu18 tendríamos que añadir en el archivo `/etc/puppet/manifests/classes/xubuntu1804/especifica-xubuntu-linex-2018.pp` la línea

```
include puppet_change_linex_password
```

La próxima vez que los clientes hagan puppet ya tendran todo configurado.

## ¿Qué hace el paquete?

Cambia la contraseña del usuario linex


