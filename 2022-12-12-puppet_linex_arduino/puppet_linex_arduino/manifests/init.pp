class puppet_linex_arduino {

  file { '/etc/pkgsync/mayhave.d/arduino': 
    owner=>root, 
    group=>root,
    mode=>644,
    content => "linex-arduino"
  }
  
  package { "linex-arduino" : ensure => present }

}
