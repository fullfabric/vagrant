# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Configuration
  config.user.defaults = {
    hostname: 'lab', # The hostname
    memory:   1536,  # The memory ceiling
    cpus:     2,     # How many CPUs can this machine user?
    cpu_cap:  75     # CPU usage ceiling
  }

  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = 'Berksfile'
  config.omnibus.chef_version = '11.16.4'

  config.vm.define(config.user.hostname) do |box|

    config.vm.provider :virtualbox do |vb|
      vb.name = "#{config.user.hostname}-precise64"

      vb.memory = config.user.memory
      vb.cpus   = config.user.cpus

      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "#{config.user.cpu_cap}"]
    end

    box.vm.box = 'official-cloud-image-precise64'
    box.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'

    box.vm.hostname = config.user.hostname

    # host-only access with static IP address
    box.vm.network :private_network, ip: '192.168.10.10'

    # port forwarding
    box.vm.network :forwarded_port, guest: 3000, host: 3000   # rails

    # folder sharing
    box.vm.synced_folder '../', '/home/vagrant/lab', type: 'nfs'

    box.ssh.forward_agent = true

    # Latest RVM installer versions require GPG key verification.
    # As we are performing a user level RVM install, we need to run in unprivileged mode.
    # i.e. with vagrant user instead of root
    config.vm.provision :shell, privileged: false, inline: 'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'

    box.vm.provision :chef_solo do |chef|
      chef.roles_path = 'lib/chef/roles'

      # These 3 settings are a fix for intermittent omibus/chef integration. More at: http://git.io/x4PsAQ
      chef_gem_path    = "/opt/chef/embedded/lib/ruby/gems/1.9.1"
      chef.binary_env  = "GEM_PATH=#{chef_gem_path} GEM_HOME=#{chef_gem_path}"
      chef.binary_path = "/opt/chef/bin"

      chef.json = {
        rvm: {
          installs: {
            # required to play nice with chef
            vagrant: {
              system_chef_solo:   '/opt/chef/bin/chef-solo',
              system_chef_client: '/opt/chef/bin/chef-client'
            }
          }
        }
      }

      chef.add_role 'ruby_runtime'
      chef.add_role 'development_box'
      chef.add_role 'full_fabric_development'
      chef.add_role 'mongodb_instance'
    end
  end
end
