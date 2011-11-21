class utility {

  yumrepo { 'epel':
    baseurl    => 'http://epel.osuosl.org/5/$basearch',
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-5&arch=$basearch',
    enabled    => 1,
    gpgcheck   => 0,
  }

  # Extra repo required for htop.
  yumrepo { 'dag':
    baseurl  => 'http://apt.sw.be/redhat/el$releasever/en/$basearch/dag',
    gpgcheck => 0,
    enabled  => 1,
  }

  package { 'htop':
    ensure  => installed,
    require => Yumrepo['dag'],
  }

  package { 'java':
    name => "java-1.6.0-openjdk.x86_64",
    ensure => installed,
  }

  # Fix a bug with Vagrant by verbosely adding the puppet group and user.
  group { "puppet":
    ensure => present,
    gid => 24,
  }

  user { "puppet":
    ensure => present,
    uid => 24,
    gid => 24,
    home => "/var/lib/puppet",
    managehome => true,
    require => Group["puppet"],
  }
}
