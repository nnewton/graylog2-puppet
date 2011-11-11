class rvm::packages {
  include rvm::packages::common
  include utility

  case $::operatingsystem {
    redhat,oel,centos,fedora: {
      class { 'rvm::packages::redhat':
        before  => Class['rvm::packages::common'],
        require => Class['utility'],
      }
    }
  }
}
