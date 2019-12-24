Vagrant.configure("2") do |config|
  config.vm.provision "ansible", type: "shell",
    inline: "echo Provisioning..."

  config.vm.synced_folder "shared-folder", "/vagrant"
  config.vm.synced_folder "playbooks", "/ansible"

  config.vm.define "centos7" do |machine|
    machine.vm.box = "bento/centos-7"
  end
  config.vm.define "debian10" do |machine|
    machine.vm.box = "bento/debian-10"
  end
  config.vm.define "freebsd12" do |machine|
    machine.vm.box = "bento/freebsd-12"
    machine.vm.synced_folder "shared-folder", "/vagrant", type: "rsync"
    machine.vm.synced_folder "playbooks", "/ansible", type: "rsync"
    machine.vm.provision "ansible", type: "shell",
      preserve_order: true,
      inline: "echo 'Installing ansible...' && sudo pkg install -y py36-ansible"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.galaxy_role_file = "requirements.yml"
    ansible.galaxy_roles_path = "/home/vagrant/.ansible/roles"
    ansible.provisioning_path = "/ansible"
    ansible.compatibility_mode = "2.0"
  end

end
