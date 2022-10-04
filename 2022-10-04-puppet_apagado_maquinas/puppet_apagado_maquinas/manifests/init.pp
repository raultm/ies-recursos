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

