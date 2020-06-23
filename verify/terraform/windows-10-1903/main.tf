provider "azurerm" {
  version = "~>2.10"
  features {}
}

provider "local" {
  version = "~>1.4"
}

resource "azurerm_resource_group" "firefoxverify" {
  name     = "FirefoxVerifyResourceGroup"
  location = "Japan East"
}

resource "azurerm_virtual_network" "firefoxverify" {
  name                = "firefoxverify-network"
  resource_group_name = azurerm_resource_group.firefoxverify.name
  location            = azurerm_resource_group.firefoxverify.location
  address_space       = ["10.5.0.0/16"]
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.firefoxverify.name
  virtual_network_name = azurerm_virtual_network.firefoxverify.name
  address_prefixes     = ["10.5.2.0/24"]
}

resource "azurerm_network_interface" "testing" {
  name                = "firefoxverify-testing-instance-nic"
  location            = azurerm_resource_group.firefoxverify.location
  resource_group_name = azurerm_resource_group.firefoxverify.name

  ip_configuration {
    name                          = "testing-instance-nic"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.5.2.10"
    public_ip_address_id          = azurerm_public_ip.testing.id
  }
}

resource "azurerm_virtual_machine" "winservtesting" {
  name                             = "firefoxverify-windows-10-1903-vm"
  location                         = azurerm_resource_group.firefoxverify.location
  resource_group_name              = azurerm_resource_group.firefoxverify.name
  network_interface_ids            = [azurerm_network_interface.testing.id]
  vm_size                          = "Standard_B2S"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    # Windows 10 Enterprise 1093
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "19h1-ent"
    version   = "latest"
  }

  storage_os_disk {
    name              = "2019-datacenter-disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
    os_type           = "Windows"
  }

  os_profile {
    computer_name  = "cc-winserv"
    admin_username = var.windows-username
    admin_password = var.windows-password
    custom_data    = file("./config/settings.ps1")
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
    winrm {
      protocol = "http"
    }
    # Auto-Login's required to configure WinRM
    additional_unattend_config {
      pass         = "oobeSystem"
      component    = "Microsoft-Windows-Shell-Setup"
      setting_name = "AutoLogon"
      content      = "<AutoLogon><Password><Value>${var.windows-password}</Value></Password><Enabled>true</Enabled><LogonCount>1</LogonCount><Username>${var.windows-username}</Username></AutoLogon>"
    }
    # Unattend config is to enable basic auth in WinRM, required for the provisioner stage.
    additional_unattend_config {
      pass         = "oobeSystem"
      component    = "Microsoft-Windows-Shell-Setup"
      setting_name = "FirstLogonCommands"
      content      = file("./config/FirstLogonCommands.xml")
    }
  }

  tags = {
    CreatedBy = "clearcode"
    Purpose   = "Describe Terraform instruction"
  }

  connection {
    host     = azurerm_public_ip.testing.ip_address
    type     = "winrm"
    port     = 5985
    https    = false
    timeout  = "2m"
    user     = var.windows-username
    password = var.windows-password
  }

#  provisioner "local-exec" {
#    command = "bash -c ansible-playbook -i ansible/hosts ansible/playbook.yml"
#  }
}

resource "azurerm_network_security_group" "testing" {
  name                = "FirefoxVerifySecurityGroup"
  location            = "Japan East"
  resource_group_name = azurerm_resource_group.firefoxverify.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "WinRM"
    priority                   = 998
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5986"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "WinRM-out"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Creating with Terraform"
  }
}

resource "azurerm_network_interface_security_group_association" "testing" {
  network_interface_id      = azurerm_network_interface.testing.id
  network_security_group_id = azurerm_network_security_group.testing.id
}

resource "azurerm_public_ip" "testing" {
  name                    = "firefoxverify-collector-pip"
  location                = azurerm_resource_group.firefoxverify.location
  resource_group_name     = azurerm_resource_group.firefoxverify.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "firefoxverify-testing-pip"
  }
}

data "azurerm_public_ip" "testing" {
  name                = azurerm_public_ip.testing.name
  resource_group_name = azurerm_virtual_machine.winservtesting.resource_group_name
}

output "win10testing_instance_public_ip_address" {
  value = data.azurerm_public_ip.testing.ip_address
}

resource "local_file" "inventory" {
  filename = "ansible/hosts"
  content  = <<EOL
[windows]
${data.azurerm_public_ip.testing.ip_address}

[windows:vars]
ansible_user=${var.windows-username}
ansible_password=${var.windows-password}
ansible_port=5986
ansible_connection=winrm
ansible_winrm_server_cert_validation=ignore
EOL
}

resource "local_file" "playbook" {
  filename = "ansible/playbook.yml"
  content  = <<EOL
- hosts: windows
  become_method: runas
  vars:
    ansible_become_password: "${var.windows-password}"
  tasks:
    - name: Allow copy and paste to the UAC dialog
      win_regedit:
        key: HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System
        value: PromptOnSecureDesktop
        data: 00000000
        datatype: dword
    - name: Set non-ASCII workgroup name
      win_domain_membership:
        domain_admin_user: "${var.windows-username}"
        domain_admin_password: "${var.windows-password}"
        state: workgroup
        workgroup_name: ワークグループ
    - name: Prepare directory to download language pack
      win_file:
        path: C:\temp
        state: directory
    - name: Download language pack file
      win_get_url:
        url: "${var.windows-language-pack-url}"
        dest: 'c:\temp\lp.cab'
    - name: Install language pack
      win_shell: |
        $LpTemp = "c:\temp\lp.cab"
        Add-WindowsPackage -PackagePath $LpTemp -Online
        Set-WinUserLanguageList -LanguageList ja-JP,en-US -Force
        Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"
        Set-WinLanguageBarOption -UseLegacySwitchMode -UseLegacyLanguageBar
        Remove-Item $LpTemp -Force
    - win_reboot:
    - win_timezone:
        timezone: Tokyo Standard Time
    - name: Set location
      win_shell: Set-WinHomeLocation -GeoId 0x7A
    - name: Set UI language
      win_shell: Set-WinUILanguageOverride -Language ja-JP
    - name: Set system language
      win_shell: Set-WinSystemLocale -SystemLocale ja-JP
    - name: Set date/time format
      win_shell: Set-WinCultureFromLanguageListOptOut -OptOut $False
    - name: Set keyboard layout
      win_shell: Set-ItemProperty 'registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters' -Name 'LayerDriver JPN' -Value 'kbd106.dll'
    - win_reboot:
    - name: Set region globally
      win_region:
        copy_settings: yes
        location: "122"
        format: ja-JP
        unicode_language: ja-JP
    - win_reboot:
    - name: Create administrator user
      win_user:
        name: "管理者"
        password: "${var.windows-password}"
        password_never_expires: true
        state: present
        groups:
          - Administrators
          - Users
          - Remote Desktop Users
    - name: Set display language for the administrator user
      become: yes
      become_user: "管理者"
      win_shell: |
        Set-WinUILanguageOverride -Language ja-JP
        Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"
    - name: Create regular user
      win_user:
        name: "ユーザー"
        password: "${var.windows-password}"
        password_never_expires: true
        state: present
        groups:
          - Users
          - Remote Desktop Users
    - name: Set display language for the regular user
      become: yes
      become_user: "ユーザー"
      win_shell: |
        Set-WinUILanguageOverride -Language ja-JP
        Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"
    - name: Setup chocolatey
      win_chocolatey:
        name: chocolatey
        state: present
    - name: Install EmEditor
      win_chocolatey:
        name: emeditor
        state: present
        allow_empty_checksums: yes
        ignore_checksums: yes
EOL
}

resource "local_file" "RDP shortcut for the administrator" {
  filename = "rdp/管理者"
  content  = <<EOL
full address:s:${data.azurerm_public_ip.testing.ip_address}:3389
prompt for credentials:i:0
administrative session:i:1
username:s:管理者
password 51:b:<powershell.exe -command "('${var.windows-password}' | ConvertTo-SecureString -AsPlainText -Force) | ConvertFrom-SecureString;">
EOL
}

resource "local_file" "RDP shortcut for the user" {
  filename = "rdp/ユーザー"
  content  = <<EOL
full address:s:${data.azurerm_public_ip.testing.ip_address}:3389
prompt for credentials:i:0
administrative session:i:1
username:s:ユーザー
password 51:b:<powershell.exe -command "('${var.windows-password}' | ConvertTo-SecureString -AsPlainText -Force) | ConvertFrom-SecureString;">
EOL
}
