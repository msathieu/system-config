#!/bin/bash
# shellcheck disable=SC2121
set system name-server 9.9.9.9
set system static-host-mapping host-name pve.strypsteen.com inet 192.168.253.2
set system sysctl parameter net.ipv6.conf.eth0.use_tempaddr value 2
set system time-zone Europe/Brussels

set interfaces ethernet eth0 address dhcp
set interfaces ethernet eth0 ipv6 address autoconf
set interfaces ethernet eth1 address 192.168.255.1/24
set interfaces ethernet eth1 address fc00::1/64
set interfaces ethernet eth2 address 192.168.254.1/24
set interfaces ethernet eth2 address fc01::1/64
set interfaces ethernet eth3 address 192.168.253.1/24
set interfaces ethernet eth3 address fc02::1/64
set interfaces wireguard wg0 address 10.0.0.1/24
set interfaces wireguard wg0 port 51820

set service ssh disable-password-authentication
set service dhcp-server hostfile-update
set service dhcp-server shared-network-name mgmt option default-router 192.168.255.1
set service dhcp-server shared-network-name mgmt option name-server 192.168.255.1
set service dhcp-server shared-network-name mgmt subnet 192.168.255.0/24 subnet-id 1
set service dhcp-server shared-network-name mgmt subnet 192.168.255.0/24 range 0 start 192.168.255.2
set service dhcp-server shared-network-name mgmt subnet 192.168.255.0/24 range 0 stop 192.168.255.254
set service dhcp-server shared-network-name mgmt subnet 192.168.255.0/24 lease 600
set service dhcp-server shared-network-name lan option default-router 192.168.254.1
set service dhcp-server shared-network-name lan option name-server 192.168.254.1
set service dhcp-server shared-network-name lan subnet 192.168.254.0/24 subnet-id 2
set service dhcp-server shared-network-name lan subnet 192.168.254.0/24 range 0 start 192.168.254.2
set service dhcp-server shared-network-name lan subnet 192.168.254.0/24 range 0 stop 192.168.254.254
set service dhcp-server shared-network-name lan subnet 192.168.254.0/24 lease 600
set service dhcp-server shared-network-name server option bootfile-name netboot.xyz.efi
set service dhcp-server shared-network-name server option bootfile-server 192.168.253.1
set service dhcp-server shared-network-name server option default-router 192.168.253.1
set service dhcp-server shared-network-name server option domain-name server.home.arpa
set service dhcp-server shared-network-name server option name-server 192.168.253.1
set service dhcp-server shared-network-name server subnet 192.168.253.0/24 subnet-id 3
set service dhcp-server shared-network-name server subnet 192.168.253.0/24 range 0 start 192.168.253.3
set service dhcp-server shared-network-name server subnet 192.168.253.0/24 range 0 stop 192.168.253.253
set service dhcp-server shared-network-name server subnet 192.168.253.0/24 lease 600
set service router-advert interface eth1 prefix ::/64
set service router-advert interface eth2 prefix ::/64
set service router-advert interface eth3 prefix ::/64
set service dns forwarding listen-address 0.0.0.0
set service dns forwarding name-server 9.9.9.9
set service dns forwarding dnssec validate
set service dns forwarding allow-from 127.0.0.1/32
set service dns forwarding allow-from 192.168.0.0/16
set service tftp-server directory /config/tftp
set service tftp-server listen-address 192.168.253.1

set nat source rule 1 outbound-interface name eth0
set nat source rule 1 translation address masquerade
set nat66 source rule 1 outbound-interface name eth0
set nat66 source rule 1 translation address masquerade

firewall_types="ipv4 ipv6"

for i in ${firewall_types}; do
  set firewall "$i" forward filter default-action drop
  set firewall "$i" forward filter rule 1 action accept
  set firewall "$i" forward filter rule 1 state established
  set firewall "$i" forward filter rule 1 state related
  set firewall "$i" forward filter rule 2 action accept
  set firewall "$i" forward filter rule 2 outbound-interface name eth0
  set firewall "$i" forward filter rule 3 action accept
  set firewall "$i" forward filter rule 3 inbound-interface name eth1
  set firewall "$i" forward filter rule 4 action accept
  set firewall "$i" forward filter rule 4 inbound-interface name eth2
  set firewall "$i" forward filter rule 4 outbound-interface name eth3
  set firewall "$i" forward filter rule 5 action accept
  set firewall "$i" forward filter rule 5 inbound-interface name eth3
  set firewall "$i" forward filter rule 5 outbound-interface name eth2
  set firewall "$i" forward filter rule 6 action accept
  set firewall "$i" forward filter rule 6 inbound-interface name wg0
done
