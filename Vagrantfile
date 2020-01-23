Vagrant.configure("2") do |config|
  config.vm.box = "EdgeOnWindows10"
  config.ssh.password = "Passw0rd!"
  config.ssh.username = "IEUser"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--vram", "32"]
  end
end
