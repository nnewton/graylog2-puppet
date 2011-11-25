class drupalgraylog2 {
  file {
    "/etc/graylog2.conf":
      source  => "puppet:///drupalgraylog2/graylog2.conf",
      mode    => 644,
      owner   => root,
      group   => root;
    "/etc/init.d/graylog2":
      source => "puppet:///drupalgraylog2/graylog2-source/bin/graylog2ctl",
      mode  => 755,
      owner => root,
      group => root;
    "/opt/graylog2":
      source => "puppet:///drupalgraylog2/graylog2-source",
      recurse => true;
  }

  package {
    "java":
      name => "java-1.6.0-openjdk",
      ensure => installed;
  }

  service { "graylog2":
    ensure => running,
    start => "/etc/init.d/graylog2 start",
    stop => "/etc/init.d/graylog2 stop",
    restart => "/etc/init.d/graylog2 restart",
    require => [ Package["java"], File["/etc/init.d/graylog2"] ],
  }
}
