class git::config {
  file { '/etc/gitconfig':
    source  => 'puppet:///modules/git/gitconfig',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['git::install']
  }
}
