FROM frrouting/frr:latest

RUN   sed -i \
	-e 's/bgpd=no/bgpd=yes/g' \
	-e 's/ospfd=no/ospfd=yes/g' \
	-e 's/isisd=no/isisd=yes/g' \
	/etc/frr/daemons