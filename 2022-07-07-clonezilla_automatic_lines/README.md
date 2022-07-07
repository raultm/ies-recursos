# Clonezilla

Con Clonezilla podemos crear y restaurar imagenes de nuestros equipos.

Con el paso de los años hemos ido investigando y hemos visto que se pueden crear algunas entradas en el GRUB para cargar en RAM Clonezilla y cargar la imagen directamente del USB o del Servidor.

El objetivo de este repositorio es tenerlas registradas

## Entradas de Grub

### Desde carpeta /var/isos del Servidor compartida por NFS

Deben añadirse al archivo del pen drive `/boot/grub/grub.cfg`

#### Imagen Oficial de Infolab

```
menuentry "Imagen Oficial Infolab (sda) por NFS de Servidor"{
	search --set -f /live/vmlinuz
	linux /live/vmlinuz toram=filesystem.squashfs boot=live union=overlay username=user config components noswap edd=on nomodeset noprompt nosplash locales="es_ES.UTF-8" keyboard-layouts=es ocs_prerun1="dhclient -v" ocs_prerun2="mount -t nfs servidor:/var/isos /home/partimag" ocs_live_run="ocs-sr -g auto -e1 auto -e2 -r -j2 -k1 -scr -icds -p poweroff restoredisk InfolabLinux-12-06-2018 sda" ocs_live_extra_param="" ocs_live_batch="yes" gfxpayload=1024x768x16,1024x768 ip=frommedia i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes
	initrd /live/initrd.img
}
```




