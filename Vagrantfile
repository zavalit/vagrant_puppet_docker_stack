
unless Vagrant.has_plugin?('vagrant-hostmanager')
  raise 'Please run --- vagrant plugin install vagrant-hostmanager ---'
end



ip = "10.20.1.10"
hostname = "phping.local";

Vagrant.configure("2") do |config|

  config.vm.define hostname do |phping|
  
    phping.vm.box = "ubuntu/trusty64"
    
    phping.vm.hostname = hostname 
    
    phping.vm.network "private_network", :ip => ip
   
    phping.hostmanager.enabled     = true
    phping.hostmanager.manage_host = true
  
    phping.vm.provision :puppet do |puppet|
  
      puppet.module_path = ["modules", "vendor/modules"]
      puppet.options     = '--debug --verbose --summarize --reports store'
  
    end


  end
 
end 
