class rvm {
  
  class { 'rvm::packages':
    before  => Class['rvm::config'],
  }
  class { 'rvm::config':
  }
}
