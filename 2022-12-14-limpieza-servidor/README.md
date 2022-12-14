
# Limpieza del Servidor

Un conjunto de scripts usados para realizar una limpieza de los homes de los usuarios.

La idea es usarlo de manera periodica, en nuestro caso una vez a la semana, aprovechamos los sabados que no hay nadie en el edificio.

Aparte de eliminar archivos que no son indispensables registramos varias cosas que nos ayudan en nuestra tarea

- Registramos el espacio antes de la limpieza
- Registramos el espacio despues de la limpieza
- Listado ordenador del uso de los homes de los profesores
- Listado ordenador del uso de los homes de los profesores

Todo esto guardado como un histórico, en cada fecha se genera una carpeta y ahí se guarda toda la información

## Casos de Uso
- Limpieza para recuperar espacio del servidor
- Información rápida para saber usuarios que mas espacio estan usando sin tener que hacer un du durante el uso

### Descargar y Descomprimir
Descargar el zip y descomprimir

```
wget https://github.com/raultm/ies-recursos/releases/download/limpieza_servidor_1.0.0/LimpiezaSemanal.zip

unzip  LimpiezaSemanal.zip
```

### Pasamos la carpeta al servidor

Copiar la carpeta `LimpiezaSemanal` en la carpeta de nuestro servidor `/root/utilidades/scripts/`

```
scp -r ./LimpiezaSemanal root@servidor:/root/utilidades/scripts/
```


### Añadir al cron la tarea

Abrimos el cron de nuestro servidor

```
crontab -e
```

Añadir la tarea el sabado a las 8 de la mañana

```
# Limpieza de fin de semana
0 8 * * 6 /root/utilidades/scripts/LimpiezaSemanal/cleanhome
```


