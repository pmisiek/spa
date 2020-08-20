Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 80, host: 8081
####### Start Docker #######
  config.vm.provision "docker" do |d|
    d.run "san", image: "pmisiek/spa-app-image:7", args: "-p 80:80"
  end
end
