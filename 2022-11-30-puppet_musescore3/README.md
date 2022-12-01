
# Puppet_musescore3

Es un paquete puppet que configura un sistema ubuntu para instalar musescore3, el objetivo es xubuntu18 que tiene la versión musescore 2 en los repositorios

- Añade un repositorio
- En el paquete se obliga a que se asegure la instalación del paquete.
- Como en los equipos puede estar el pkgsync funcionando creo un archivo en mayhave.d

## Casos de Uso
- Ordenadores con ubuntu 18 que la ultima versión que tienen en repositorios es musescore2

### Descargar y Descomprimir
Descargar el zip y descomprimir

```
wget https://github.com/raultm/ies-recursos/releases/download/root_musescore3_1.0.0/puppet_musescore3.zip

unzip  puppet_musescore3.zip
```

### Pasamos el modulo a nuestra carpeta de módulos del servidor

Copiar la carpeta `puppet_musescore3` en la carpeta de nuestro servidor puppet `/etc/puppet/modules`

```
scp -r ./puppet_musescore3 root@servidor:/etc/puppet/modules/
```


### Añadir a la clase/clases que queramos

Añadir el módulo en donde queramos, si queremos añadirlo a todos los equipos con xubuntu18 tendríamos que añadir en el archivo `/etc/puppet/manifests/classes/xubuntu1804/especifica-xubuntu-linex-2018.pp` la línea

```
include puppet_musescore3
```

La próxima vez que los clientes hagan puppet ya tendran todo configurado.

## ¿Qué hace el paquete?

- Añade un repositorio
- En el paquete se obliga a que se asegure la instalación del paquete.
- Como en los equipos puede estar el pkgsync funcionando creo un archivo en mayhave.d


