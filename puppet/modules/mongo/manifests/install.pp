class mongo::install {
  package { 'mongo-10gen':
    ensure  => installed,
    require => [ Class['mongo::common'], ],
  }
  package { 'mongo-10gen-server':
    ensure => installed,
    require => [ Class['mongo::common'], Package['mongo-10gen'] ]
  }
}
