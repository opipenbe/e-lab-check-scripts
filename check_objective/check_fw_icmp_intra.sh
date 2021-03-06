#/bin/bash

# Author: Olari Pipenberg. 

cd "$(dirname "$0")"
ip netns exec eth2_ns ip route add default via 192.168.99.254
# Check ssh
! ip netns exec eth2_ns ./check_ssh.sh nopw > /dev/null &&
ip netns exec eth2_ns fping -t 100 192.168.99.254 > /dev/null &&
ip netns exec eth3_ns fping -t 100 192.168.88.254 > /dev/null &&
! ip netns exec eth4_ns fping -t 100 192.168.109.254 > /dev/null &&
ip netns exec eth2_ns ip route del default via 192.168.99.254 &&
echo "ICMP is configured for INTRA" &&
exit 0


ip netns exec eth2_ns ip route del default via 192.168.99.254
echo "ICMP is not configured for INTRA!"
exit 1
