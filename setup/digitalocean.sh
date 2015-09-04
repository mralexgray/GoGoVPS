#!/bin/bash

request () {
	
  # method=$2 && [[ -z $method ]] && method="GET"
	# [[ $# == 3 ]] && D='-d $3'
	# echo "D is $D"
  curl -s -X ${2:-GET} -H "Content-Type: application/json" -H "Authorization: Bearer $DO_KEY" "https://api.digitalocean.com/v2/$1"
}

list-droplets () { 
  request droplets | jq -r '.droplets[] | "\(.id) \(.networks.v4[0].ip_address) \(.name)"'
}

create-droplet () { 
  request droplets POST "$1" 
	# | jq -r '.droplet | "\(.id) \(.name)"'
}

delete-droplet () {
  request droplets/$1 DELETE
}

list-keys () {
  request account/keys | jq -r '.ssh_keys[] | "\(.id) \(.fingerprint) \(.name)"'
}

list-images () {
  request images | jq -r '.images[] | "\(.id) \(.slug)"'
}

list-sizes () {
  request sizes | jq -r '.sizes[] | "\(.slug) \(.memory) \(.vcpus) \(.price_monthly) \(.price_hourly)"'
}

case $1 in

  create)
    read -p "Name: " name 
    read -p "Region: [ny3] " region 
		[[ -z $region ]] && region=nyc3
    read -p "Size: [512mb] " size 
		[[ -z $size ]] && size=512mb
    read -p "Image: [ubuntu-15-04-x64] " image 
		[[ -z $image ]] && image=12658446
    # read -p "SSH keys: [[916266]] " ssh_keys
		# [[ -z $ssh_keys ]] && ssh_keys=916266
    # if [[ -n $ssh_keys ]]; then
			
			# echo -e "\a"
			# echo "ssh_keys are $ssh_keys"
      # ssh_keys=\"${ssh_keys//,/\",\"}\" #wrap in quotes
			# echo "ssh_keys are $ssh_keys"
    # fi
		# ssh_keys="$(/bin/cat ~/.ssh/id_rsa.pub)"
		# ssh_keys=\"${ssh_keys//,/\",\"}\" #wrap in quotes"
		# echo "ssh_keys are $ssh_keys"
		 # "https://api.digitalocean.com/v2/droplets"
		
    		data="{\"name\":\"$name\",\"region\":\"$region\",\"size\":\"$size\",\"image\":\"ubuntu-14-04-x64\",\"ssh_keys\":null,\"backups\":false,\"ipv6\":true }"
		
		# "ssh_keys":[%s]}' $name $region $size $image $ssh_keys)"
		echo "$data"
	  request droplets POST "$data" 
		#"$1" 
		
    # create-droplet $data
    ;;

  keys) 		list-keys ;;
  sizes) 		list-sizes ;;
  images) 	list-images ;;
  ls) 			list-droplets ;;
  help|'') 	echo "Displaying help" 	;;
  ssh) 			ssh $(list-droplets | grep -m 1 $2 | awk '{print $2}') ;;
  delete) 	delete-droplet $(list-droplets | grep -m 1 $2 | awk '{print $2}') ;;
	
esac