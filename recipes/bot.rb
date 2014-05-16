

subscribers = Array.new()
# find all hosts that contain actors
hosts = search(:node, 'mca_dist_bot:actors')
hosts.each do |host|
  %w{parsers writers downloaders crawlers}.each do |type|
    # for each host, get all actors of type 'type'
    host['mca_dist_bot']['actors'][type].each do |name, actor|
      subscriber = {
        'channel' => channels[type],
        'protocol'=> 'tcp',
        'system-name' => name,
        'hostname' => host['ipaddress'],
        'port' => actor['port']
      }
      subscribers.push(subscriber)
    end unless host['mca_dist_bot']['actors'][type].nil?
  end
end

# config crawlers crawler that has been declared
node['mca_dist_bot']['actors']['bot'].each do |name, crawler|
  data = {
    'name' => name, 
    'channel' => 'crawl', 
    'data-path' => "hdfs://#{namenode['ipaddress']}:#{namenode['hadoop']['hdfs']['name']['port']}/#{node['mca_dist_bot']['hdfs']['data_path']}"
  }
  sys_config = {
    'name' => 'CompletedNode', 
    'hostname' => node['ipaddress'], 
    'port' => crawler[:port]
  }
  properties = {
    'reserved' => 0
  }
  template "#{node['mca_dist_botexec']['bot_dir']}/nodes/#{name}.xml" do
    source "crawler.xml.erb"
    mode 0644
    owner node['mca_dist_botexec']['user']
    group node['mca_dist_botexec']['group']
    variables(
      :data => data,
      :sys_config => sys_config,
      :bots => crawler['bots'],
      :subscribers => subscribers,
      :properties => properties
    )
  end
  # include the bots recipe belonging to this crawler
  crawler['bots'].each do |bot_name|
    include_recipe "mca_dist_bot::#{bot_name}"
    
    # create script to start bot
    template "#{node['mca_dist_botexec']['bot_dir']}/bots/#{bot_name}/bin/#{bot_name}.sh" do
      source "start.sh.erb"
      variables(
        'bot_dir' => node['mca_dist_botexec']['bot_dir'],
        'crawler_name' => name,
        'crawler_ip' => node['ipaddress'],
        'crawler_port' => crawler['port'],
        'bot_name' => bot_name
      )
      owner node['mca_dist_botexec']['user']
      group node['mca_dist_botexec']['group']
      mode 0775
    end
  end
  
  # start the crawler
  #service "crawler-#{name}" do
  # start_command "su hduser; #{node['mca_dist_botexec']['bot_dir']}/nodes/bin/node.sh #{name} start"
  # action :start
  #end
  execute "start-crawler-#{name}" do
    command "#{node['mca_dist_botexec']['bot_dir']}/nodes/bin/node.sh #{name} start"
    user node['mca_dist_botexec']['user']
    group node['mca_dist_botexec']['group']
  end
end

