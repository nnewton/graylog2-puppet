class graylog2::server::install {
  file { '/opt/graylog2-server':
    ensure => directory,
    recurse => true,
    purge => true,
    owner => 'root',
    group => 'root',
    mode => 0644,
    source => "puppet:///modules/graylog2/graylog2-server",
  }
}

