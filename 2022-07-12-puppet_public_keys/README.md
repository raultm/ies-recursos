# Puppet_public_keys

Es un paquete puppet que pone el certificado que tu quieras en las maquinas gestionadas.

Permite la conexión SSH sin contraseña

## Casos de Uso
- Conexión SSH a equipos gestionados sin contraseña

### Descargar y Descomprimir
Descargar el zip y descomprimir

```
wget https://github.com/raultm/ies-recursos/releases/download/puppet_public_keys_1.0.0/puppet_public_keys.zip

unzip  puppet_public_keys.zip
```

### Configurar el paquete con el Contenido de la Clave

Comprobar si tienes la clave creada

```
cat ~/.ssh/id_rsa.pub
```
Si te dice que archivo no encontrado tendrás que crearlo.

```
ssh-keygen -t rsa
```

Una vez tengas la clave debes recoger contenido de la clave, del contenido debes eliminar la parte del tipo
```
$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2...
```

ssh-rsa **AAAAB3NzaC1yc2...**

Copiamos lo que está en negrita y los ponemos en el campo `key` en el archivo `manifests/init.pp`

```
class puppet_public_keys {

  ssh_authorized_key { 'syadmin_machin_public_key':
    ensure => 'present',
    user => 'root',
    type => 'rsa',
    key => 'CONTENIDO del comando cat ~/.ssh/id_rsa.pub. Ejemplo AAAAB3NzaC1yc2...'
  }
}
```

### Pasamos el modulo a nuestra carpeta de módulos del servidor

Copiar la carpeta `puppet_public_keys` en la carpeta de nuestro servidor puppet `/etc/puppet/modules`

```
scp -r ./puppet_public_keys root@servidor:/etc/puppet/modules/
```


### Añadir a la clase/clases que queramos

Añadir el módulo en donde queramos, si queremos añadirlo a todos los equipos con xubuntu18 tendríamos que añadir en el archivo `/etc/puppet/manifests/classes/xubuntu1804/especifica-xubuntu-linex-2018.pp` la línea

```
include puppet_public_keys
```

La próxima vez que los clientes hagan puppet ya tendran todo configurado.

## ¿Qué hace el paquete?

Pone el certificado que tu quieras en las maquinas gestionadas.



