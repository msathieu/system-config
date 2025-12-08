#!/usr/bin/env bash
# shellcheck disable=SC2121
set system name-server 9.9.9.9
set system static-host-mapping host-name trace.svc.ui.com inet 0.0.0.1
set system static-host-mapping host-name k8s-gw.strypsteen.com inet 192.168.253.34
set system static-host-mapping host-name k8s-gw.strypsteen.com alias auth.strypsteen.com
set system static-host-mapping host-name k8s-gw.strypsteen.com alias cloud.strypsteen.com
set system static-host-mapping host-name k8s-gw.strypsteen.com alias console.strypsteen.com
set system static-host-mapping host-name k8s-gw.strypsteen.com alias git.strypsteen.com
set system static-host-mapping host-name k8s-gw.strypsteen.com alias matrix.strypsteen.com
set system static-host-mapping host-name k8s-gw.strypsteen.com alias metrics.strypsteen.com
set system static-host-mapping host-name k8s-gw.strypsteen.com alias mta-sts.strypsteen.com
set system static-host-mapping host-name k8s-gw.strypsteen.com alias vault.strypsteen.com
set system static-host-mapping host-name k8s-gw.strypsteen.com alias mta-sts.strypsteen.me
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com inet 192.168.253.35
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias unifi
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias code.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias code-sandbox.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias imagegen.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias llm.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias monitoring.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias network.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias office.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias photos.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias remote-desktop.strypsteen.com
set system static-host-mapping host-name k8s-gw-internal.strypsteen.com alias textgen.strypsteen.com
set system static-host-mapping host-name k8s-test.strypsteen.com inet 192.168.253.36
set system sysctl parameter net.ipv6.conf.eth0.use_tempaddr value 2
set system time-zone Europe/Brussels
set system update-check url https://raw.githubusercontent.com/vyos/vyos-nightly-build/refs/heads/current/version.json

set interfaces ethernet eth0 address dhcp
set interfaces ethernet eth0 ipv6 address autoconf
set interfaces bridge br0 stp
set interfaces bridge br0 priority 0
set interfaces bridge br0 enable-vlan
set interfaces bridge br0 ip enable-proxy-arp
set interfaces bridge br0 member interface eth1 allowed-vlan 1-4094
set interfaces bridge br0 member interface eth1 native-vlan 128
set interfaces bridge br0 member interface eth2 allowed-vlan 1-4094
set interfaces bridge br0 member interface eth2 native-vlan 128
set interfaces bridge br0 member interface eth3 allowed-vlan 1-4094
set interfaces bridge br0 member interface eth3 native-vlan 128
set interfaces bridge br0 vif 128 address 192.168.128.1/24
set interfaces bridge br0 vif 255 address 192.168.255.1/24
set interfaces bridge br0 vif 255 address fc00::1/64
set interfaces bridge br0 vif 254 address 192.168.254.1/24
set interfaces bridge br0 vif 254 address fc01::1/64
set interfaces bridge br0 vif 253 address 192.168.253.1/24
set interfaces bridge br0 vif 253 address fc02::1/64

set service ssh disable-password-authentication
set service ssh listen-address 192.168.255.1
set service dhcp-server hostfile-update
set service dhcp-server shared-network-name infra option default-router 192.168.128.1
set service dhcp-server shared-network-name infra option name-server 192.168.128.1
set service dhcp-server shared-network-name infra subnet 192.168.128.0/24 subnet-id 128
set service dhcp-server shared-network-name infra subnet 192.168.128.0/24 range 0 start 192.168.128.2
set service dhcp-server shared-network-name infra subnet 192.168.128.0/24 range 0 stop 192.168.128.254
set service dhcp-server shared-network-name infra subnet 192.168.128.0/24 lease 3600
set service dhcp-server shared-network-name mgmt option default-router 192.168.255.1
set service dhcp-server shared-network-name mgmt option domain-name mgmt.home.arpa
set service dhcp-server shared-network-name mgmt option name-server 192.168.255.1
set service dhcp-server shared-network-name mgmt subnet 192.168.255.0/24 subnet-id 255
set service dhcp-server shared-network-name mgmt subnet 192.168.255.0/24 range 0 start 192.168.255.2
set service dhcp-server shared-network-name mgmt subnet 192.168.255.0/24 range 0 stop 192.168.255.254
set service dhcp-server shared-network-name mgmt subnet 192.168.255.0/24 lease 3600
set service dhcp-server shared-network-name lan option default-router 192.168.254.1
set service dhcp-server shared-network-name lan option domain-name lan.home.arpa
set service dhcp-server shared-network-name lan option name-server 192.168.254.1
set service dhcp-server shared-network-name lan subnet 192.168.254.0/24 subnet-id 254
set service dhcp-server shared-network-name lan subnet 192.168.254.0/24 range 0 start 192.168.254.2
set service dhcp-server shared-network-name lan subnet 192.168.254.0/24 range 0 stop 192.168.254.254
set service dhcp-server shared-network-name lan subnet 192.168.254.0/24 lease 3600
set service dhcp-server shared-network-name server option bootfile-name netboot.xyz.efi
set service dhcp-server shared-network-name server option bootfile-server 192.168.253.1
set service dhcp-server shared-network-name server option default-router 192.168.253.1
set service dhcp-server shared-network-name server option domain-name server.home.arpa
set service dhcp-server shared-network-name server option name-server 192.168.253.1
set service dhcp-server shared-network-name server subnet 192.168.253.0/24 subnet-id 253
set service dhcp-server shared-network-name server subnet 192.168.253.0/24 range 0 start 192.168.253.50
set service dhcp-server shared-network-name server subnet 192.168.253.0/24 range 0 stop 192.168.253.254
set service dhcp-server shared-network-name server subnet 192.168.253.0/24 lease 3600
set service router-advert interface br0.255 prefix ::/64
set service router-advert interface br0.255 name-server fc00::1
set service router-advert interface br0.254 prefix ::/64
set service router-advert interface br0.254 name-server fc01::1
set service router-advert interface br0.253 prefix ::/64
set service router-advert interface br0.253 name-server fc02::1
set service dns forwarding listen-address 192.168.128.1
set service dns forwarding listen-address 192.168.252.1
set service dns forwarding listen-address 192.168.253.1
set service dns forwarding listen-address 192.168.254.1
set service dns forwarding listen-address 192.168.255.1
set service dns forwarding listen-address fc00::1
set service dns forwarding listen-address fc01::1
set service dns forwarding listen-address fc02::1
set service dns forwarding name-server 127.0.0.1
set service dns forwarding dnssec validate
set service dns forwarding allow-from 192.168.0.0/16
set service dns forwarding allow-from 100.81.0.0/16
set service dns forwarding allow-from fc00::/7
set service tftp-server directory /config/tftp
set service tftp-server listen-address 192.168.253.1
set service lldp

set nat source rule 1 outbound-interface name eth0
set nat source rule 1 translation address masquerade
set nat66 source rule 1 outbound-interface name eth0
set nat66 source rule 1 translation address masquerade

set container name netbird image netbirdio/netbird
set container name netbird volume netbird source /config/netbird
set container name netbird volume netbird destination /var/lib/netbird
set container name netbird allow-host-networks
set container name netbird capability net-admin
set container name netbird capability net-raw

delete firewall

set firewall global-options source-validation strict
set firewall global-options ipv6-source-validation strict

firewall_types="ipv4 ipv6"

for i in ${firewall_types}; do
  set firewall "$i" forward filter default-action drop
  set firewall "$i" forward filter rule 1 action accept
  set firewall "$i" forward filter rule 1 state established
  set firewall "$i" forward filter rule 1 state related
  set firewall "$i" forward filter rule 2 action accept
  set firewall "$i" forward filter rule 2 inbound-interface name br0.254
  set firewall "$i" forward filter rule 2 outbound-interface name eth0
  set firewall "$i" forward filter rule 3 action accept
  set firewall "$i" forward filter rule 3 inbound-interface name br0.253
  set firewall "$i" forward filter rule 3 outbound-interface name eth0
  set firewall "$i" forward filter rule 4 action accept
  set firewall "$i" forward filter rule 4 inbound-interface name wt0
  set firewall "$i" forward filter rule 4 outbound-interface name eth0
  set firewall "$i" forward filter rule 5 action accept
  set firewall "$i" forward filter rule 5 inbound-interface name br0.255
  set firewall "$i" forward filter rule 6 action accept
  set firewall "$i" forward filter rule 6 inbound-interface name br0.128
  set firewall "$i" forward filter rule 6 outbound-interface name br0.253
  set firewall "$i" forward filter rule 6 protocol tcp
  set firewall "$i" forward filter rule 6 destination port 8080
  set firewall "$i" forward filter rule 7 action accept
  set firewall "$i" forward filter rule 7 inbound-interface name wt0
  set firewall "$i" forward filter rule 7 outbound-interface name br0.253
  set firewall "$i" forward filter rule 8 action accept
  set firewall "$i" forward filter rule 8 inbound-interface name br0.254
  set firewall "$i" forward filter rule 8 outbound-interface name br0.253
  set firewall "$i" forward filter rule 8 protocol tcp_udp
  set firewall "$i" forward filter rule 8 destination port 443
done
set firewall ipv4 forward filter rule 9 action accept
set firewall ipv4 forward filter rule 9 protocol tcp
set firewall ipv4 forward filter rule 9 destination address 192.168.253.32
set firewall ipv4 forward filter rule 9 destination port 22
set firewall ipv4 forward filter rule 9 inbound-interface name eth0
set firewall ipv4 forward filter rule 9 source geoip country-code be
