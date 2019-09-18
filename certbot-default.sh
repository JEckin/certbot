#!/bin/bash
software() {
clear
echo "Software:"
echo "1. Apache"
echo "2. Nginx - x"
echo "3. Haproxy -x "
echo "4. Plesk -x "
read t
case "$t" in
1)
task="a"
;;
2)
task="b"
;;
3)
task="c"
;;
4)
task="d"
;;
*)
main
;;
esac
system
}

system(){
clear
echo "System:"
echo "1. Ubuntu 18.04. LTS"
echo "2. Ubuntu 16.04 - x"
echo "3. Ubuntu (other) -x "
echo "4. Debian 10 -x "
echo "5. Debian 9 -x "
echo "6. Debian 8 -x "
echo "7. FreeBSD -x "
echo "8. OpenBSD 6.0+ - x "
read s
case "$s" in
1)
task+="a"
;;
2)
task+="b"
;;
3)
task+="c"
;;
4)
task+="d"
;;
5)
task+="e"
;;
6)
task+="f"
;;
7)
task+="g"
;;
8)
task+="h"
;;
*)
system
;;
$task
}

aa(){
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
sudo apt-get install certbot python-certbot-apache -y
certbot --apache
echo "0 3 * * 5	$USER	certbot renew --dry-run" >> /etc/crontab
}
ba(){
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
sudo apt-get install certbot python-certbot-nginx -y
certbot --nginx
echo "0 3 * * 5	$USER	certbot renew --dry-run" >> /etc/crontab
}



software
