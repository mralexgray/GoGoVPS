#!/usr/bin/env node

// https://github.com/oliwerhelsen/dropletapi

var API = require('dropletapi'),
	TOKEN = (process.env.DO_TOKEN),
	DROPLETS = new API.Droplets(TOKEN);
/*
DROPLETS.listDroplets(function(error, results) {

	console.log(error ? error : results);

	if (results.droplets.count > 1) {
		results.droplets.forEach(function(result) {
			
			if (result.name == 'example.com') {

				DROPLETS.deleteDroplet(result.id, function(error, deleted) {
					if (error) 
						console.log('problem deleting ' + result.name + ' err: ' + error);
					else 
						console.log(deleted);

				});

			}			
			// console.log(result.name + ' -> ' + result.id)
		});
	}
	else 
		DROPLETS.availableKernelsForDroplet(results.droplets[0], function (error, result) {
			
	          if (error) {
	              console.log(error);
	          }
	          else {
	              console.log(result);
	          }
	      });

});
*/
var DATA = {

	"name": 'autodrop.mrgray.com',
	"region": 'nyc3',
	"size": '512mb',
	"image": 12940941,
	"ssh_keys": [916266],
	"backups": false,
	"ipv6": true,
	"private_networking": true,
	"user_data": "#cloud-config \
 \
apt_upgrade: true \
 \
packages: \
  - zsh \
	- git \
	- uml-utilities \
	- python-software-properties \
	- curl \
	- node \
 \
users: \
  - name: localadmin \
    ssh-authorized-keys: \
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF/ndjJn18vFauDrIAe50ss3xGtRDW66kmPnNF+2hOxel5eSw8mPdNNpo9TfWQZ38MtZqmB5D+HvCiRxGOS/H+7O06Cc1LxtRhKky9g1Sd68I5fmTGCqHJFncxon7/cGBr9ZzrHdtyf5GB4K9Azwnc2KtjNOal8KXFdKY7qFPxlxdcMxhR1pRsJdPSEC7wWbO/cxv3IwDXC5hOa1t8Ax2OTcT9+rtXD9mtp58V/5D31jqrJoGjB0TvYxzeihKOG7nQz+aLS/MvW6hZavKTpS8FLUhIFRlkilAEwA5A6TU9EuCmrhNPhHz1MspKczZmjO2tCF4jcbxTRJr194sbFYV1 alex@mrgray.com \
    sudo: ['ALL=(ALL) NOPASSWD:ALL'] \
    groups: sudo \
    shell: /bin/zsh \
 \
runcmd: \
	- sed -i -e '/.*net.ipv4.ip_forward.*/net.ipv4.ip_forward=1/' etc/sysctl.conf \
	- sed -i -e \"s/\(.*PermitRootLogin.*\)/\1\\`echo -e '\n\r'`PermitTunnel yes/\" \
  - restart ssh \
"
}


DROPLETS.createDroplet(DATA, function (err,res) {

		console.log('1: ' + err ? 'ERROR' : res ? 'RESULT' : 'NOTHING TO PRINT!' + ' : ' + err ? err : res ? res : 'NADA')

		if (res) {

			var NEW_NAME = res.droplet.name;
			// console.log(Object.keys(res.droplet))

			var DOMAINS = new API.Domains
			var DNS_DATA = {
				"name": NEW_NAME, // res.droplet.name, // "digitaloceanisthebombdiggity.com",
				"ip_address": "1.2.3.4"
			}

			DOMAINS.createDomain(DNS_DATA, function(err, res) {
				console.log('2: ' + err ? 'ERROR' : res ? 'RESULT' : 'NOTHING TO PRINT!' + ' : ' + err ? err : res ? res : 'NADA')
			})
		}
})
