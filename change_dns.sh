# Include confirm.sh
source /usr/local/bin/confirm.sh

[ $# -lt 2 ] && echo "Usage: $0 device dns1 dns2" && exit 1

device=$1
dns1=$2
dns2=$3

[ $2 == "open" ] && echo "Using opendns." && dns1=208.67.222.222 && dns2=208.67.220.220
[ $2 == "us" ] && echo "Using USA dns." && dns1=173.199.144.68 && dns2=206.214.214.28
[ $2 == "uk" ] && echo "Using UK dns." && dns1=194.168.8.100 && dns2=194.168.4.100

echo "Current DNS servers for $device:"
networksetup -getdnsservers $device

confirm "Overwrite DNS servers?" && \
echo "Overwriting..." && \
sudo networksetup -setdnsservers $device $dns1 $dns2 && \
echo "Flushing DNS cache..." && \
sudo killall -HUP mDNSResponder && \
echo "Done" && exit 1

echo "Cancelled overwrite"
