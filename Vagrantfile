Vagrant::Config.run do |config|
  config.vm.box = "centos56"
  config.vm.provision :puppet do |puppet|
     puppet.pp_path = "/tmp/vagrant-puppet"
     puppet.manifests_path = "puppet"
     puppet.module_path = "puppet/modules"
     puppet.manifest_file = "init.pp"
   end
end
