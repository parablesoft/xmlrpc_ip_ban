##Install

####Clone the repo
git clone git@github.com:parablesoft/xmlrpc_ip_ban.git 

####Install iptables-persistent
apt-get install iptables-persistent

####Configuration

#####ip_ban.sh
There are two paths on line 2. The first is the path to the apache log file. The second is the path to the bad_ips.txt file that is an extraction from the log. The ruby file will generate this, so essentially you just need to say where you want it to be stored. The user account that will be running the cronjob will need to be able to create this file and write to it. So make sure the permissions are good. 

On line 3, that's location of the ruby script. 

#####ip_parser.rb
Put the path to the bad_ips.txt that you configured in the shell script. If you are using xmlrpc.php for legit reasons, then configure the white listing. These ip addresses will get ignored by the parser when they are found in the log. 

#####cron
*/5 * * * *  sh /root/ip_ban/ip_ban.sh > /root/ip_ban/cron.log 2>&1

Make sure the shell script is pointing to the right path, and make sure the cron log is pointing to the right path. 



##Running
You can manually by going to the directory and doing sh ip_ban.sh