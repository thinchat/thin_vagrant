require 'vagrant'

namespace :dev do
  desc "Setup Vagrant"
  task :setup do
    verbose(true)
    env = Vagrant::Environment.new(:ui_class => Vagrant::UI::Colored)
    puts "Adding lucid32.box as 'development'..."
    # env.cli("box", "add", "development", "http://files.vagrantup.com/lucid32.box")
    puts "Initializing Vagrant..."
    puts `cp vagrantfile.default Vagrantfile`
    puts "Run 'vagrant up'"
    puts "Starting Vagrant..."
    env.cli("up")
    puts `cp vagrantfile.post_install Vagrantfile`
    puts `vagrant ssh -c /home/deployer/.rbenv/bin/rbenv global 1.9.3-p194`
  end

  desc "Start Vagrant"
  task :start do
    env = Vagrant::Environment.new
    puts "Starting Vagrant..."
    env.cli("up")
  end

  desc "Restart Vagrant"
  task :restart do
    env = Vagrant::Environment.new
    puts "Restarting Vagrant..."
    env.cli("reload")
  end

  desc "Shutdown Vagrant"
  task :shutdown do
    env = Vagrant::Environment.new
    raise "Run 'vagrant up' to create your Vagrant" if !env.primary_vm.created?
    raise "Vagrant isn't running" if env.primary_vm.state != :running
    puts "Shutting down Vagrant..."
    env.primary_vm.channel.sudo("halt")
  end

  desc "Destructobomb Vagrant"
  task :implode do
    env = Vagrant::Environment.new
    puts `rm Vagrantfile`
    puts `vagrant box remove development`
    env.cli("destroy --force")
  end
end
