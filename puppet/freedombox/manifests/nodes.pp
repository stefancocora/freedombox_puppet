node 'debian.localnet' {

    class { freedombox_apt_update:
        stage => 'pre'
    }
    include freedombox_motd
    include freedombox_default_packages

}
