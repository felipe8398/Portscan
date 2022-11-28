if [ "$1" == "" ] ||[ "$2" == "" ]
then
echo "Modo de uso: $0 192.168.0 80"
else
for host in $(seq 1 254);
do
hping3 -S -p $2 -c 1 $1.$host 2> /dev/null | grep flags=SA | awk -F " " '{print $2}' | awk -F "ip=" '{print $2}'
done
fi
