
# setup main source
include_recipe "mca_dist_bot"

# find all hosts that contain crawlers
hosts = search(:node, 'mca_dist_bot:actors:crawlers')
hosts.each do |host|
	# for each host, get all its crawlers
	host['mca_dist_bot']['actors']['crawlers'].each do |name, crawler|
		# for each crawler, get all its bot
		crawler['bots'].each do |bot_name|
			# create script to start bot
			template "#{node['mca_dist_botexec']['bot_dir']}/bots/#{bot_name}.sh" do
				source "start.sh.erb"
				variables(
					'crawler_name' => name,
					'crawler_ip' => node['ipaddress'],
					'crawler_port' => crawler['port']
				)
				mode 0775
			end
		end
	end
end

