# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/bionic64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
  
  # config.vm.network :public_network, bridge:"Wi-Fi", ip: "192.168.56.200"
  config.vm.network "private_network", ip: "192.168.33.2"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine

    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "init env", type: "shell", inline: <<-SHELL
      apt-get update
      timedatectl set-timezone Asia/Tokyo
      apt-get install -y emacs25-nox zsh lv
      chsh vagrant -s /usr/bin/zsh

      apt-get install -y gcc make libssl-dev libreadline-dev zlib1g-dev
  SHELL
  
  config.vm.provision "dot files", type: "shell", privileged: false, inline: <<-SHELL
      cp /vagrant/dot.tmux.conf /home/vagrant/.tmux.conf
      cp /vagrant/dot.zshrc /home/vagrant/.zshrc
      cp /vagrant/dot.gitignore /home/vagrant/.gitignore
      cp /vagrant/dot.gitconfig /home/vagrant/.gitconfig

      ln -f -s /vagrant/project /home/vagrant/
  SHELL

  config.vm.provision "ruby", type:"shell", privileged: false, inline: <<-SHELL
      export RBENV=~/.rbenv/bin
      export PATH=$RBENV:$PATH
      curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
      rbenv install -v 2.6.0
      rbenv global 2.6.0
  SHELL

  config.vm.provision "pyenv", type:"shell", privileged: false, inline: <<-SHELL
      git clone https://github.com/yyuu/pyenv.git ~/.pyenv
      export PYENV_ROOT="$HOME/.pyenv"
      export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init -)"
      pyenv install -v anaconda3-5.3.1
      pyenv rehash
      pyenv global anaconda3-5.3.1
      conda update conda
  SHELL

end
