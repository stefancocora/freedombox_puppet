
class freedombox_default_packages::install {

    # Defaults for all packages:
    Package {
        ensure  => installed,
    }

    # Specific packages:

    # utils
    package { ['dialog', 'htop', 'lsof', 'man-db', 'rsync', 'git-core', 'dstat', 'less']: }

    # network
    package { ['iputils-ping', 'hping3', 'tshark', 'ngrep', 'strace', 'tcpdump', 'whois', 'ftp', 'iptraf', 'dnsutils', 'netcat', 'socat', 'nmap', 'telnet', 'mtr', 'traceroute', 'tcptraceroute']: }

}

class freedombox_default_packages::service {

    # Defaults for all services:
    Service {
        require => Class["freedombox_default_packages::config"],
        ensure  => running,
        enable  => true
    }

    # Specific services:

}

class freedombox_default_packages::config {

    # Defaults for all files in here:
    File { 
        require => Class["freedombox_default_packages::install"],
        notify  => Class["freedombox_default_packages::service"],
        owner   => root,
        group   => root,
        mode    => 644
    }

    # Specific files
    # (use content => template("freedombox_default_packages/<path>") to use templates from
    #  this module).

}

#
# Class: freedombox_default_packages
#
# Description of freedombox_default_packages
#

class freedombox_default_packages {

    include freedombox_default_packages::install, freedombox_default_packages::config, freedombox_default_packages::service

}
