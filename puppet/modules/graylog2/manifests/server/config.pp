class graylog2::server::config {
  file { '/etc/graylog2.conf':
    source  => 'puppet:///modules/graylog2/graylog2.conf',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['graylog2::server::install'],
    notify  => Class['graylog2::server::service']
  }

  file {'/etc/init/graylog2-server.conf':
    source  => 'puppet:///modules/graylog2/server/graylog2-server.conf',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['graylog2::server::install'],
  }
}
