class mongo::service {
  service { 'mongod':
    ensure     => 'running',
    enable     => 'true',
    start      => '/etc/init.d/mongod start',
    stop        => '/etc/init.d/mongod stop',
    restart    => '/etc/init.d/mongod restart',
    require    => Class['mongo::config'],
  }
}

