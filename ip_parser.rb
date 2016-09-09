
f = File.readlines("bad_ips.txt")
whitelist = []

f.each do |ip_line|
	ip = ip_line.split(" ").last
	next if whitelist.include? ip
	cmd = "iptables -A INPUT -s #{ip}  -j DROP"
	system(cmd)
	puts "#{ip} banned"
end


