class git::install {
  package { 'git-all':
    ensure => [ latest, installed ],
    require => Yumrepo["epel"],
  }
}
