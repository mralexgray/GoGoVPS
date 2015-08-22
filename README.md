# `vps_config`

I never really quite understood why a casual internet user might _want_ or _need_ a VPS. Until I got one. 

### What's so great about having a VPS?

- You have a publicly accessible, always-on presence on the Internet.
- A VPS probably has a much faster connection than you do at home/work.
- There is no firewall on your VPS.
- VPS' are _disposable_. Try things out without fear of losing your critical data / whatnot. 
- VPS' don't take up space, electricity, or aggravation in your physical world.

### What is `vps_config` and why is it SO great?

- Clone this repo wherever you want to manage and interact with your VPS.
- Sets up dns.he.net DNS entries for your VPS allowing you to use myvps.mydomain.com instead of IP's.


# Previously submodules

[submodule "digital-ocean-pptp-vpn"]
	path = modules/digital-ocean-pptp-vpn
	url = git@github.com:MdNor/digital-ocean-pptp-vpn.git
[submodule "openvpn_autoconfig"]
	path = modules/openvpn_autoconfig
	url = git@github.com:tinfoil/openvpn_autoconfig.git
[submodule "pyHurricaneDNS"]
	path = modules/pyHurricaneDNS
	url = git@github.com:tresni/pyHurricaneDNS.git
[submodule "darling"]
	path = modules/darling
	url = https://github.com/LubosD/darling.git


#secrets

To run this thing from a private repo, you MUST set and env variable with your oath token

`GITHUB_OATH=<TOKEN>`

## Usage

`vps_config` can be run a FEW ways.

From a cloned github repo (i.e. on your local development machine)

`git clone https://github.com/mralexgray/vps_config.git && vps_config`