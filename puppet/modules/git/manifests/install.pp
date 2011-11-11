class git::install {
  package { 'git-all':
    ensure => installed,
  }
}
