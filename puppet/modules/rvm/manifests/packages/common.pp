class rvm::packages::common {
  include git

  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/rvm/bin',
  }

  exec { 'download-rvm-install':
    command => 'wget -O /tmp/rvm https://rvm.beginrescueend.com/install/rvm',
    creates => '/tmp/rvm',
    unless  => "test -e /usr/local/rvm",
  }
  exec { 'install-rvm':
    command => "bash /tmp/rvm",
    creates => '/usr/local/rvm/bin/rvm',
    require => [ Exec['download-rvm-install'], Package['git-all'] ],
    unless  => "test -e /usr/local/rvm",
  }
  exec { 'remove-rvm':
    command => '/bin/rm -rf /tmp/rvm',
    require => Exec['install-rvm'],
    unless  => "test -e /tmp/rvm",
  }
  file { '/tmp/rvm':
    ensure  => absent,
    require => Exec['remove-rvm'],
  }
}
