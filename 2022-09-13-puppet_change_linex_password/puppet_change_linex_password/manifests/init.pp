class puppet_change_linex_password {

  # Para crear una clave cifrada usar mkpasswd del paquete whois:
  # mkpasswd -m sha-512
  user { linex: 
    ensure => present,
    shell => '/bin/bash',
    password => 'HASH-SHAs256::mkpasswd -m sha-256 P4ssw0rd',
  }
}
