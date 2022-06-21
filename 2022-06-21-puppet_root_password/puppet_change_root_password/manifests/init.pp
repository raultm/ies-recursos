class puppet_change_root_password {

  user { root: 
    ensure => present,
    shell => '/bin/bash',
    password => 'HASH-SHAs256::mkpasswd -m sha-256 P4ssw0rd',
  }
}
