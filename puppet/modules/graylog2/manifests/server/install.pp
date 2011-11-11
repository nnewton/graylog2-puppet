class graylog2::server::install {
  exec { 'download_graylog':
    cwd     => '/tmp',
    command => '/usr/bin/wget --no-check-certificate https://github.com/downloads/Graylog2/graylog2-server/graylog2-server-0.9.5p1.tar.gz',
    unless  => 'test -e /opt/graylog2',
  }

  exec { 'untar_graylog':
    cwd     => '/tmp',
    command => '/bin/tar -xzvf graylog2-server-0.9.5p1.tar.gz',
    require => Exec['download_graylog'],
    unless  => 'test -e /opt/graylog2',
  }

  exec { 'move_graylog':
   cwd     => '/tmp',
   command => '/bin/mv graylog2-server-0.9.5p1/ graylog2/',
   require => Exec['untar_graylog'],
   unless  => 'test -e /opt/graylog2',
  }

  exec { 'place_graylog':
    cwd     => '/tmp',
    command => '/bin/mv graylog2/ /opt/',
    require => Exec['move_graylog'],
    unless  => 'test -e /opt/graylog2',
  }
}


