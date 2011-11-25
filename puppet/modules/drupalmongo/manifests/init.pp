class drupalmongo {
  # The official 10gen repo contains much more recent packages.
  yumrepo { "10gen":
    name     => "10gen",
    baseurl  => "http://downloads-distro.mongodb.org/repo/redhat/os/i686",
    gpgcheck => 0,
  }

  package {
    "mongo-10gen":
      ensure  => installed,
      require => Yumrepo["10gen"];
    "mongo-10gen-server":
      ensure => installed,
      require => [ Yumrepo["10gen"], Package["mongo-10gen"] ];
  }

  file { "/etc/mongodb.conf":
    source  => "puppet:///drupalmongo/mongodb.conf",
    mode    => 755,
    owner   => root,
    group   => root,
    require => [ Package["mongo-10gen"], Package["mongo-10gen-server"] ],
  }

  service { "mongod":
    ensure    => running,
    enable    => true,
    start     => "/etc/init.d/mongod start",
    stop      => "/etc/init.d/mongod stop",
    restart   => "/etc/init.d/mongod restart",
    require   => [ File["/etc/mongodb.conf"], Package["mongo-10gen"], Package["mongo-10gen-server"] ],
  }
}