#FROM HERE
#
# https://stackoverflow.com/questions/39216830/how-could-i-ping-my-docker-container-from-my-host

sysctl net.ipv4.conf.all.forwarding=1

sudo iptables -P FORWARD ACCEPT

