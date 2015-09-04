#!/usr/bin/env sh

# shipwright get account/keys

# exit

shipwright create droplets --fromfile=user_data,<<EOF
#cloud-config

apt_upgrade: true

packages:
  - zsh
	- git
	- uml-utilities
	- python-software-properties
	- curl
	- node

users:
  - name: localadmin
    ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF/ndjJn18vFauDrIAe50ss3xGtRDW66kmPnNF+2hOxel5eSw8mPdNNpo9TfWQZ38MtZqmB5D+HvCiRxGOS/H+7O06Cc1LxtRhKky9g1Sd68I5fmTGCqHJFncxon7/cGBr9ZzrHdtyf5GB4K9Azwnc2KtjNOal8KXFdKY7qFPxlxdcMxhR1pRsJdPSEC7wWbO/cxv3IwDXC5hOa1t8Ax2OTcT9+rtXD9mtp58V/5D31jqrJoGjB0TvYxzeihKOG7nQz+aLS/MvW6hZavKTpS8FLUhIFRlkilAEwA5A6TU9EuCmrhNPhHz1MspKczZmjO2tCF4jcbxTRJr194sbFYV1 alex@mrgray.com
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/zsh
		
runcmd:
	- sed -i -e '/.*net.ipv4.ip_forward.*/net.ipv4.ip_forward=1/' etc/sysctl.conf
	- sed -i -e "s/\(.*PermitRootLogin.*\)/\1\\`echo -e '\n\r'`PermitTunnel yes/"
  - restart ssh

	write_files:
	  - path: /etc/ssh/sshd_config
	    content: |
				Port 22
				Protocol 2
				HostKey /etc/ssh/ssh_host_rsa_key
				PermitRootLogin yes
				PubkeyAuthentication yes
				PermitRootLogin yes
			 	PermitTunnel yes
				PrintLastLog yes
				AllowUsers localadmin
EOF
name=mrgray.com region=nyc3 size=512mb image=owncloud ssh_keys=[916266] private_networking=true ipv6=true

	# # - sed -i -e '/^#(net\/ipv4\/ip_forward=1|net\/ipv6\/conf\/default\/forwarding=1|net\/ipv6\/conf\/all\/forwarding=1)$/\1/' /etc/ufw/sysctl.conf
	# - - sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config /etc/ssh/sshd_config
	#
	#   # - sed -i -e '/DEFAULT_FORWARD_POLICY=\"DROP\"/DEFAULT_FORWARD_POLICY=\"ACCEPT\"/'
	#   # - sed -i -e '/^Port/s/^.*$/Port 4444/' /etc/ssh/sshd_config
	#   # - sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config
	#   - sed -i -e '$aAllowUsers demo' /etc/ssh/sshd_config
  # - restart ssh


# "
#  name=cloud.mrgray.com region=nyc3 size=512mb image=node ssh_keys=[916266] private_networking=true
#
# droplet:
#     features:
#         - virtio
#     id:                 <droplet id>
#     vcpus:              1
#     networks:
#
#     name:               01-sfo1-docker
#     disk:               20
#     memory:             512
#     locked:             true
#     size:
#
#     snapshot_ids:
#         (empty array)
#     backup_ids:
#         (empty array)
#     image:
#
#     kernel:
#     id:      4782
#     name:    Ubuntu 14.04 x64 vmlinuz-3.13.0-52-generic-docker-memlimit
#     version: 3.13.0-52-generic
#     size_slug:          512mb
#     status:             new
#     next_backup_window: null
#     created_at:         2015-06-19T20:32:02Z
#     region:
#
#     links:
#         actions:
#             -
#             id:   <action id>
#             rel:  create
#             href: https://api.digitalocean.com/v2/actions/<action id>
# Contributing
#
# P