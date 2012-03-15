
class freedombox_apt_update::install {

    # Defaults for all packages:
    Package {
        ensure => installed
    }

    # Specific packages:

    package { 'apt': }

}

class freedombox_apt_update::service {

    # Defaults for all services:
    Service {
        require => Class["freedombox_apt_update::config"],
        ensure  => running,
        enable  => true
    }

    # Specific services:

}

class freedombox_apt_update::config {

    # Defaults for all files in here:
    File { 
        require => Class["freedombox_apt_update::install"],
        notify  => Class["freedombox_apt_update::service"],
        owner   => root,
        group   => root,
        mode    => 644
    }

    # Specific files
    # (use content => template("freedombox_apt_update/<path>") to use templates from
    #  this module).

    exec { 'update-apt':
        command => 'apt-get update',
    }

#    file { '/etc/apt/sources.list':
#        ensure  => present,
#        source  => 'puppet:///modules/freedombox_apt_update/sources.list',
#        require => File['/etc/apt/sources.list.d/multistrap-debian.list']
#    }

}

#
# Class: freedombox_apt_update
#
# Description of freedombox_apt_update
#

class freedombox_apt_update {

    include freedombox_apt_update::install, freedombox_apt_update::config, freedombox_apt_update::service

}
