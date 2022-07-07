# Clonezilla

Con Clonezilla podemos crear y restaurar imagenes de nuestros equipos.

Con el paso de los años hemos ido investigando y hemos visto que se pueden crear algunas entradas en el GRUB para cargar en RAM Clonezilla y cargar la imagen directamente del USB o del Servidor.

El objetivo de este repositorio es tenerlas registradas

## Entradas de Grub

Deben añadirse al archivo del pen drive `/boot/grub/grub.cfg`

- [Imagenes en Servidor - NFS](#desde-carpeta-varisos-del-servidor-compartida-por-nfs)
  - [Oficiales](#oficiales)
    - [Imagen Infolab](#imagen-infolab)
  - [Customizadas](#customizadas)
    - [Imagen Workstation No NFS](#imagen-workstation-no-nfs)
- [Imagenes en USB](#desde-carpeta-homepartimag-del-usb)
  - [Oficiales](#oficiales)
    - [Imagen Infolab](#imagen-infolab)
### Desde carpeta /var/isos del Servidor compartida por NFS

#### Oficiales

##### Imagen Infolab

```
menuentry "Imagen Oficial Infolab (sda) por NFS de Servidor"{
	search --set -f /live/vmlinuz
	linux /live/vmlinuz toram=filesystem.squashfs boot=live union=overlay username=user config components noswap edd=on nomodeset noprompt nosplash locales="es_ES.UTF-8" keyboard-layouts=es ocs_prerun1="dhclient -v" ocs_prerun2="mount -t nfs servidor:/var/isos /home/partimag" ocs_live_run="ocs-sr -g auto -e1 auto -e2 -r -j2 -k1 -scr -icds -p poweroff restoredisk InfolabLinux-12-06-2018 sda" ocs_live_extra_param="" ocs_live_batch="yes" gfxpayload=1024x768x16,1024x768 ip=frommedia i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes
	initrd /live/initrd.img
}
```

#### Customizadas

##### Imagen Workstation No NFS

```
menuentry "Imagen Workstation No NFS (sda) por NFS de Servidor"{
	search --set -f /live/vmlinuz
	linux /live/vmlinuz toram=filesystem.squashfs boot=live union=overlay username=user config components noswap edd=on nomodeset noprompt nosplash locales="es_ES.UTF-8" keyboard-layouts=es ocs_prerun1="dhclient -v" ocs_prerun2="mount -t nfs servidor:/var/isos/misisos /home/partimag" ocs_live_run="ocs-sr -g auto -e1 auto -e2 -r -j2 -k1 -scr -icds -p poweroff restoredisk infolab2022nonfs sda" ocs_live_extra_param="" ocs_live_batch="yes" gfxpayload=1024x768x16,1024x768 ip=frommedia i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes
	initrd /live/initrd.img
}
```

### Desde carpeta /home/partimag del USB

#### Oficiales

##### Imagen Infolab

```
menuentry "Imagen Oficial Infolab (sda sdb) por USB"{
  search --set -f /live/vmlinuz
  linux /live/vmlinuz boot=live union=overlay username=user config components quiet noswap edd=on nomodeset noeject locales=es_ES.UTF-8 keyboard-layouts=NONE ocs_live_run="ocs-live-restore" ocs_live_extra_param="-g auto -e1 auto -e2 -r -j2 -k1 -scr -icds -p poweroff restoredisk InfolabLinux-12-06-2018 sda sdb" ocs_live_batch="yes" ocs_live_keymap="es_ES.UTF-8" vga=788 ip= net.ifnames=0 splash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.enable_fbdev=1
  initrd /live/initrd.img
}
```





