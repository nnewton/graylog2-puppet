class graylog2::server::install {
  exec { 'remove_old_tarball':
    cwd => '/tmp',
    command => '/bin/rm graylog2-server-0.9.5p1.tar.gz',
    onlyif => 'test -e graylog2-server-0.9.5p1.tar.gz',
  }

  exec { 'download_graylog':
    cwd     => '/tmp',
    command => '/usr/bin/wget --no-check-certificate https://github.com/downloads/Graylog2/graylog2-server/graylog2-server-0.9.5p1.tar.gz',
    unless  => 'test -e /opt/graylog2-server',
    require => Exec['remove_old_tarball'],
  }

  exec { 'remove_old_tmp_folder':
    cwd => '/tmp',
    command => '/bin/rm -rf /tmp/graylog2-server',
    unless => 'test -e /tmp/graylog2-server',
  }

  exec { 'remove_opt_folder':
    cwd => '/tmp',
    command => '/bin/rm -rf /opt/graylog2-server',
  }

  exec { 'untar_graylog':
    cwd     => '/tmp',
    command => '/usr/bin/sudo /bin/tar -xzvf graylog2-server-0.9.5p1.tar.gz',
    require => [ Exec['remove_old_tmp_folder'], Exec['download_graylog'] ],
    unless  => 'test -e /opt/graylog2-server',
  }

  exec { 'rename_graylog':
   cwd     => '/tmp',
   command => '/bin/mv graylog2-server-0.9.5p1/ graylog2-server/',
   require => [ Exec['untar_graylog'], Exec['remove_old_tmp_folder'] ],
   unless  => 'test -e /opt/graylog2-server',
  }

  exec { 'place_graylog':
    cwd     => '/tmp',
    command => '/usr/bin/sudo /bin/mv graylog2-server/ /opt/',
    require => [ Exec['rename_graylog'], Exec['remove_opt_folder'] ],
    unless  => 'test -e /opt/graylog2-server',
  }
}


