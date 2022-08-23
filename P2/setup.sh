
set -e
############LEFT ROUTEUR########################
#create a interface br0 :
ip link add br0 type bridge

#bring up interface br0 :
ip link set dev br0 up

#add ip address to interface eth0  :

ip addr add 10.1.1.1/24 dev eth0


#left create vxlan interfance and set remote et local going request : 
ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.2 local 10.1.1.1 dstport 4789

#add ip address to vxlan interface :
ip addr add 20.1.1.1/24 dev vxlan10

#add eth1, vxlan interface into br0 : 
brctl addif br0 eth1
brctl addif br0 vxlan10

#bring up vxlan interface :
ip link set dev vxlan10 up


########################RIGHT ROUTEUR#########################################
#create a interface br0 :
ip link add br0 type bridge

#bring up interface br0 :
ip link set dev br0 up

#right
ip addr add 10.1.1.2/24 dev eth0

ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.1 local 10.1.1.2 dstport 4789 

#add ip address to vxlan interface :
ip addr add 20.1.1.2/24 dev vxlan10

#add eth1, vxlan interface into br0 : 
brctl addif br0 eth1
brctl addif br0 vxlan10

#bring up vxlan interface :
ip link set dev vxlan10 up


####################HOST#################

#left host
ip addr add 30.1.1.1/24 dev eth1
#right
ip addr add 30.1.1.2/24 dev eth1
