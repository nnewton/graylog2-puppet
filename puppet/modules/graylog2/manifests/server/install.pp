class graylog2::server::install {
  package { 'graylog2-server':
    ensure  => 'present',
    require => [ Class['mongo::service'], Class['graylog2::common'], ],
  }
}

