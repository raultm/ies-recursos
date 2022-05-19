class puppet_loggers {
 
    file { '/usr/local/sbin/temp-log'     : owner=>root, group=>root,mode=>775,source => "puppet:///modules/puppet_loggers/commands/temp-log"}
    file { '/usr/local/sbin/temp-viewlogs': owner=>root, group=>root,mode=>775,source => "puppet:///modules/puppet_loggers/commands/temp-viewlogs"}
    
    file { '/usr/local/sbin/temp-vga': owner=>root, group=>root,mode=>775,source => "puppet:///modules/puppet_loggers/commands/temp-vga"}
    file { '/usr/local/sbin/temp-mb' : owner=>root, group=>root,mode=>775,source => "puppet:///modules/puppet_loggers/commands/temp-mb"}
    file { '/usr/local/sbin/temp-hdd': owner=>root, group=>root,mode=>775,source => "puppet:///modules/puppet_loggers/commands/temp-hdd"}
    file { '/usr/local/sbin/temp-cpu': owner=>root, group=>root,mode=>775,source => "puppet:///modules/puppet_loggers/commands/temp-cpu"}
    
    cron {  vgatemp: command => "/usr/local/sbin/temp-vga", user => root, ensure => present, minute => "*/10" }
    cron {  mbtemp : command => "/usr/local/sbin/temp-mb" , user => root, ensure => present, minute => "*/10" }
    cron {  hddtemp: command => "/usr/local/sbin/temp-hdd", user => root, ensure => present, minute => "*/10" }
    cron {  cputemp: command => "/usr/local/sbin/temp-cpu", user => root, ensure => present, minute => "*/10" }
}
  
