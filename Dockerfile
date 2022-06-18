FROM ubuntu:latest

RUN apt-get update \
 && apt-get install -y isc-dhcp-server \
 && rm -rf /var/lib/apt/lists/*

RUN touch /var/lib/dhcp/dhcpd.leases
VOLUME ["/var/lib/dhcp", "/etc/dhcp"]


ADD ./dhcpd.conf /etc/dhcp
ADD ./rndc.key /etc/dhcp/ddns-keys/rndc.key
CMD ["bash"]