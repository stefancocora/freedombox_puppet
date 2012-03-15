
class freedombox_motd::install {

    # Defaults for all packages:
    Package {
        ensure  => installed,
    }

    # Specific packages:

}

class freedombox_motd::service {

    # Defaults for all services:
    Service {
        require => Class["freedombox_motd::config"],
        ensure  => running,
        enable  => true
    }

    # Specific services:

}

class freedombox_motd::config {

    # Defaults for all files in here:
    File { 
        require => Class["freedombox_motd::install"],
        notify  => Class["freedombox_motd::service"],
        owner   => root,
        group   => root,
        mode    => 644
    }

    # Specific files
    # (use content => template("freedombox_motd/<path>") to use templates from
    #  this module).

    file { '/var/run/motd':
        ensure  => present,
        source  => "puppet:///modules/freedombox_motd/motd"
    }

}

#
# Class: freedombox_motd
#
# Description of freedombox_motd
#

class freedombox_motd {

    include freedombox_motd::install, freedombox_motd::config, freedombox_motd::service

}
