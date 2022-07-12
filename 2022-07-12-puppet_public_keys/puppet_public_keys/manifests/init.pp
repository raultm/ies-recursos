class puppet_public_keys {

  # Generar Clave si no la tienes ya creada
  # ssh-keygen -t rsa

  # Ver contenido de la clave
  # cat ~/.ssh/id_rsa.pub
  
  # Para evitar que pida la contraseña cuando accedas desde tu máquina/usuario
  ssh_authorized_key { 'syadmin_machin_public_key':
    ensure => 'present',
    user => 'root',
    type => 'rsa',
    key => 'CONTENIDO del comando cat ~/.ssh/id_rsa.pub. Ejemplo AAAAB3NzaC1yc2...'
  }
}
