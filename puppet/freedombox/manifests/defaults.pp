File {
    ignore => [ ".svn", "CVS", ".hg", ".git" ],
}

Exec {
    path => [
        "/usr/local/sbin",
        "/usr/local/bin",
        "/usr/sbin",
        "/usr/bin",
        "/sbin",
        "/bin"
    ]
}

# Configure extlookup - used to keep sensitive data 
# to-do implement hiera
$extlookup_datadir="${settings::manifestdir}/extdata"
$extlookup_precedence = [ 'sensitive', 'notsensitive' ]

