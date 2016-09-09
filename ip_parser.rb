
f = File.readlines("bad_ips.txt")
whitelist = ["47.202.18.133","45.55.52.204"]

f.each do |ip_line|
	ip = ip_line.split(" ").last
	next if whitelist.include? ip
	cmd = "iptables -A INPUT -s #{ip}  -j DROP"
	system(cmd)
	puts "#{ip} banned"
end


