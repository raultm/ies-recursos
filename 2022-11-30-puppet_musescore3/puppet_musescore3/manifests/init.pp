class puppet_musescore3 {

  exec { 'add_musescore3_repository':
    command => "sudo add-apt-repository ppa:mscore-ubuntu/mscore3-stable -y"
  }

  file { '/etc/pkgsync/mayhave.d/musescore3': 
    owner=>root, 
    group=>root,
    mode=>644,
    content => "musescore3"
  }
  
  package { "musescore3" : ensure => present }

}
