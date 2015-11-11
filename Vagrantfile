# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Vagrantfile that emulates an ARM architecture on the Docker host machine. QEMU is installed to emulate.
#

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.synced_folder "/Users/maartenhuijsmans", "/Users/maartenhuijsmans",
        :nfs => true,
        :linux__nfs_options => ["no_root_squash"], :map_uid => 0, :map_gid => 0

    config.vm.provision "docker" do |d|
        #d.build_image "/vagrant"
    end

    config.vm.define :docker_arm do |docker|
        docker.vm.box = "ubuntu/trusty64"
        docker.vm.network "private_network", ip: "10.2.0.10", netmask: "255.255.0.0"
        docker.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "1024", "--nicpromisc2", "allow-all"]
        end
    end

    $script = <<SCRIPT
echo 'cd /vagrant' >> /home/vagrant/.profile
sudo apt-get install qemu binfmt-support qemu-user-static -y

usermod -a -G docker vagrant
echo 'DOCKER_OPTS="-g=/mnt/docker -H 0.0.0.0:4243"' >> /etc/default/docker
# DOCKER_OPTS="-g=/mnt/docker -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"

echo '# Set DOCKER_HOST' >> /home/vagrant/.bashrc
echo 'export DOCKER_HOST="tcp://127.0.0.1:4243"' >> /home/vagrant/.bashrc
service docker restart
SCRIPT

   config.vm.provision :shell, :inline => $script
end
