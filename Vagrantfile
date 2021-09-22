# frozen_string_literal: true

# see https://www.vagrantup.com/docs/vagrantfile/version
VAGRANTFILE_API_VERSION = '2'

# see https://www.vagrantup.com/docs/vagrantfile/vagrant_version
Vagrant.require_version '>= 2.2.18'

Vagrant.configure("2") do |config|

  # see https://www.vagrantup.com/docs/vagrantfile/machine_settings#config-vm-box
  config.vm.box = "Win10"

  # see https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/ for a full list
  # see https://www.vagrantup.com/docs/vagrantfile/machine_settings#config-vm-box_url
  config.vm.box_url = 'file://MSEdge - Win10.box'

  # allow for boot up to complete as it can be a slow operation
  # see https://www.vagrantup.com/docs/vagrantfile/machine_settings#config-vm-boot_timeout
  config.vm.boot_timeout = 300

  # Port forwarding for Windows Remote Management (WinRM) and Remote Desktop Protocol (RDP)
  # see https://www.vagrantup.com/docs/vagrantfile/machine_settings#config-vm-network
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

  # Port forwarding for Nomad HTTP API (nomad-http), RPC interface (nomad-rpc) and Serf WAN (nomad-serf)
  # see https://www.nomadproject.io/docs/install/production/requirements#ports-used
  # see https://www.vagrantup.com/docs/vagrantfile/machine_settings#config-vm-network
  config.vm.network :forwarded_port, guest: 4646, host: 4646, id: "nomad-http", auto_correct: true
  config.vm.network :forwarded_port, guest: 4647, host: 4647, id: "nomad-rpc", auto_correct: true
  config.vm.network :forwarded_port, guest: 4648, host: 4648, id: "nomad-serf", auto_correct: true

  # see https://www.vagrantup.com/docs/vagrantfile/machine_settings#config-vm-communicator
  config.vm.communicator = "winrm"

  # see https://www.vagrantup.com/docs/provisioning/shell#options
  config.vm.provision "shell", privileged: "true", powershell_elevated_interactive: "true", path: "scripts/install-windows-updates.ps1"
  config.vm.provision "shell", privileged: "true", powershell_elevated_interactive: "true", path: "scripts/install-chocolatey.ps1"
  config.vm.provision "shell", privileged: "true", powershell_elevated_interactive: "true", path: "scripts/install-chocolatey-packages.ps1"

  # see https://www.vagrantup.com/docs/vagrantfile/machine_settings#config-vm-hostname
  config.winrm.hostname = "localhost"

  # default passwords as set by box maintainers
  # see https://az792536.vo.msecnd.net/vms/release_notes_license_terms_8_1_15.pdf
  # see https://www.vagrantup.com/docs/vagrantfile/winrm_settings#config-winrm-username
  config.winrm.username = "IEUser"
  config.winrm.password = "Passw0rd!"
  config.vm.guest       = :windows

  # see https://www.vagrantup.com/docs/vagrantfile/machine_settings#config-vm-synced_folder
  #config.vm.synced_folder "/TODO", "/TODO"

  config.vm.provider "virtualbox" do |vb|
    # see https://www.vagrantup.com/docs/providers/virtualbox/configuration#gui-vs-headless
    vb.gui = true

    # see https://www.vagrantup.com/docs/providers/virtualbox/configuration#vboxmanage-customizations
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--vram",   "256"]
    vb.customize ["modifyvm", :id, "--cpus",   "2"]

    # see https://www.virtualbox.org/manual/ch03.html#settings-motherboard
    #vb.customize ["modifyvm", :id, "--ioapic", "on"]

    # see http://station.clancats.com/3-vagrant-settings-you-should-check-out-to-optimize-your-vm/
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

    # see https://www.virtualbox.org/manual/UserManual.html#ts_linux-guest-x11-services
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']

    # enable USB support (this requires the Oracle Extension Pack)
    # see https://www.virtualbox.org/manual/UserManual.html#usb-support
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbxhci", "on"]
  end
end
