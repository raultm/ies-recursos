class puppet_printers_reset {
 
    file { '/usr/local/sbin/ies-printers': owner=>root, group=>root,mode=>775,source => "puppet:///modules/puppet_printers_reset/commands/ies-printers"}
    file { '/etc/sudoers.d/printers': owner=>root, group=>root,mode=>775,source => "puppet:///modules/puppet_printers_reset/sudoers.d/printers"}
    file { '/etc/profile.d/ies-printers.sh': owner=>root, group=>root,mode=>644,source => "puppet:///modules/puppet_printers_reset/profile.d/ies-printers"}
    
}
  
