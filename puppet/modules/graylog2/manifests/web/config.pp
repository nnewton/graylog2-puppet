class graylog2::web::config {
  file { '/opt/graylog2-web/config/mongoid.yml':
    source  => 'puppet:///modules/graylog2/web/mongoid.yml',
    mode    => '0644',
    owner   => 'graylog2-web',
    group   => 'graylog2-web',
    require => Class['graylog2::web::install'],
  }
  file {'/opt/graylog2-web/config/email.yml':
    source  => 'puppet:///modules/graylog2/web/email.yml',
    mode    => '0644',
    owner   => 'graylog2-web',
    group   => 'graylog2-web',
    require => Class['graylog2::web::install'],
  }
  file {'/opt/graylog2-web/config/general':
    source  => 'puppet:///modules/graylog2/web/general.yml',
    mode    => '0644',
    owner   => 'graylog2-web',
    group   => 'graylog2-web',
    require => Class['graylog2::web::install'],
  }
  file {'/etc/init/graylog2-web.conf':
    source  => 'puppet:///modules/graylog2/web/graylog2-web.conf',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Class['graylog2::web::install'],
  }
}
