class mongo::common {
  yumrepo { '10gen':
    name     => '10gen',
    baseurl  => 'http://downloads-distro.mongodb.org/repo/redhat/os/i686',
    gpgcheck => 0,
  }
}
