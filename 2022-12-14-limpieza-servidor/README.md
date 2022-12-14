
# Puppet_linex_arduino

Es un paquete puppet que configura un sistema ubuntu para instalar linex_arduino, la versión arduino de la seccion

- En el paquete se obliga a que se asegure la instalación del paquete.
- Como en los equipos puede estar el pkgsync funcionando creo un archivo en mayhave.d

## Casos de Uso
- Ordenadores de uso de tecnología o similares que hagan uso de arduino

### Descargar y Descomprimir
Descargar el zip y descomprimir

```
wget https://github.com/raultm/ies-recursos/releases/download/puppet_linex_arduino_1.0.0/puppet_linex_arduino.zip

unzip  puppet_linex_arduino.zip
```

### Pasamos el modulo a nuestra carpeta de módulos del servidor

Copiar la carpeta `puppet_linex_arduino` en la carpeta de nuestro servidor puppet `/etc/puppet/modules`

```
scp -r ./puppet_linex_arduino root@servidor:/etc/puppet/modules/
```


### Añadir a la clase/clases que queramos

Añadir el módulo en donde queramos, si queremos añadirlo a todos los equipos con xubuntu18 tendríamos que añadir en el archivo `/etc/puppet/manifests/classes/xubuntu1804/especifica-xubuntu-linex-2018.pp` la línea

```
include puppet_linex_arduino
```

La próxima vez que los clientes hagan puppet ya tendran todo configurado.

## ¿Qué hace el paquete?

- En el paquete se obliga a que se asegure la instalación del paquete.
- Como en los equipos puede estar el pkgsync funcionando creo un archivo en mayhave.d


