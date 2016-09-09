iptables --flush
grep xmlrpc /var/log/apache2/other_vhosts_access.log | awk '{print $2}' | sort -n | uniq -c | sort -nr | head -20 > /root/ip_ban/bad_ips.txt
ruby /root/ip_ban/ip_parser.rb
sudo invoke-rc.d iptables-persistent save
