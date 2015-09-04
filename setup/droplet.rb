droplet = DropletKit::Droplet.new(name: 'example.com', region: 'nyc3', size: '512mb', image: 'ubuntu-14-04-x64', ipv6: true)
client.droplets.create(droplet)