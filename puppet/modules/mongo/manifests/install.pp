class mongo::install {
  notify{'Installing mongodb': }
  package { 'mongodb':
    ensure  => 'installed',
    require => [ Class['mongo::common'], ],
  }
  package { 'mongodb-server':
    ensure => 'installed',
    require => [ Class['mongo::common'], Package['mongodb'] ]
  }
}
