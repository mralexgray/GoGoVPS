#!/usr/bin/env bash

# NAME: create-bridge-netif.sh							
# AUTHOR: Marc Weisel								
# DATE: 03/04/2014
# NOTES: Tested with Mac OS X 10.9 (Mavericks); Bash v3.2.51(1)-release

# FUNCTIONS
## Is the TAP network interface available?
tap_exist() {
  if [[ $tap =~ ^tap[0-9]+$ ]]; then
    $IFCONFIG $tap &> /dev/null
    if [ $? -ne 0 ]; then
      echo "ERROR: The $tap virtual network interface is not available." >&2
      return 1  
    fi
  else 
    echo "ERROR: Verify the tap variable has been created and properly initialized." >&2
    return 1
  fi
}

## Is the vmnet network interface available? 
## If true, bring the interface down and remove the IP configuration.
vmnet_exist() {
  if [[ $vmnet =~ ^vmnet[0-9]+$ ]]; then
    $IFCONFIG $vmnet &> /dev/null
    if [ $? -ne 0 ]; then
      echo "ERROR: The $vmnet virtual network needs to be created in VMware Fusion." >&2
      return 1  
    else
      sudo $IFCONFIG $vmnet down
      sudo $IFCONFIG $vmnet inet delete &> /dev/null
      return 0
    fi
  else 
    echo "ERROR: Verify the vmnet variable has been created and properly initialized." >&2
    return 1
  fi
}

## Does the bridge network interface exist? If true, delete it.
bridge_exist() {
  if [[ $bridge =~ ^bridge[0-9]+$ ]]; then
    $IFCONFIG $bridge &> /dev/null
    if [ $? -eq 0 ]; then
      sudo $IFCONFIG $bridge destroy
      return 0
    fi
  else 
    echo "ERROR: Verify the bridge variable has been created and properly initialized." >&2
    return 1
  fi
}

## Create the bridge network interface, add members, and bring up.
create_bridge() {
  tap_exist && vmnet_exist && bridge_exist
  if [ $? -ne 0 ]; then
    #echo "ERROR: An error occured creating the bridge network interface." >&2
    unset -v {bridge,tap,vmnet}
    return 1
  else
    sudo $IFCONFIG $bridge create;
    sudo $IFCONFIG $bridge addm $tap addm $vmnet
    sudo $IFCONFIG $bridge up;
    echo "INFO: The $bridge network interface is available."
    unset -v {bridge,tap,vmnet}
    return 0
  fi
}

# MAIN
IFCONFIG='/sbin/ifconfig'

## Check for the GNS3 process
# pgrep -x 'GNS3' &> /dev/null
# if [ $? -ne 0 ]; then
#   echo "ERROR: Open the GNS3 application and the GNS3 project." >&2
#   exit 1
# fi

## Check for the VMware Fusion process
pgrep -x 'VMware Fusion' &> /dev/null
if [ $? -ne 0 ]; then
  echo "ERROR: Open the VMware Fusion application." >&2
  exit 1
fi

## bridge0
bridge="bridge0"
tap="tap0"
vmnet="vmnet2"
create_bridge

## bridge1
# bridge="bridge1"
# tap="tap1"
# vmnet="vmnet11"
# create_bridge

## bridge2
# bridge="bridge2"
# tap="tap2"
# vmnet="vmnet12"
# create_bridge

## bridge3
# bridge="bridge3"
# tap="tap3"
# vmnet="vmnet13"
# create_bridge

## bridge4
# bridge="bridge4"
# tap="tap4"
# vmnet="vmnet14"
# create_bridge

## bridge5
# bridge="bridge5"
# tap="tap5"
# vmnet="vmnet15"
# create_bridge
