class graylog2::web::service {
  service {'graylog2-web':
    ensure   => 'running',
    require  => [ Class['graylog2::server'], Class['graylog2::web::install'], Class['graylog2::web::config'], ],
  }
}
