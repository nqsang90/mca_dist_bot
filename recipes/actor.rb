
# setup the directory structure
include_recipe "mca_dist_bot"

classes = {'fetch' => 'vn.mobivi.inventory.crawler.actor.remote.Fetchr',
          'write' => 'vn.mobivi.inventory.crawler.actor.remote.Writer',
          'download' => 'vn.mobivi.inventory.crawler.actor.remote.Downloader'}

hbase_master = search(:node, 'recipes:hbase\:\:master')
hbase_master = [node] if node.recipes.include?('hbase::master')

if hbase_master.nil?
  raise "No hbase master node found"
else
  hbase_master = hbase_master.first
end

zookeeper = search(:node, 'recipes:hbase\:\:zookeeper')
zookeeper = [node] if node.recipes.include?('hbase::zookeeper')

if zookeeper.nil?
  raise "No zookeeper found"
else
  zookeeper = zookeeper.first
end

# for each actor type
node['mca_dist_bot']['actors'].each do |type, actor|
  next if actor.empty?
  # build the config information for this actor
  storage_props = {
    'hbase.master' => "#{hbase_master['fqdn']}:#{hbase_master['hbase']['master']['hbase_site']['hbase.master.port']}",
    'hbase.zookeeper.quorum' => zookeeper['fqdn'],
    'hbase.zookeeper.property.clientPort' => zookeeper['hbase']['zookeeper']['client_port']
  }
  if type == 'bot'
    props = {
      'node.bot.bot-dir' => '',
      'node.bot.port-range' => "#{actor['bot_ports']['min']}-#{actor['bot_ports']['max']}",
      'node.bot.bot-script' => '',
      'node.bot.context.crawler' => '',
      'node.bot.context.normalization' => ''
    }
  else
    props = {
      'class' => classes[type],
      'num-actors' => actor[:num_actors],
      'max-routes' => actor[:max_routes]
    }
  end

  actor.merge!({
    'channel' => type,
    'storage_path' => 'hbase',
    'storage_props' => storage_props,
    'type' => 'CompletedNode',
    'hosttype' => node['ipaddress'],
    'port' => actor[:port],
    'props' => props
  })

  bot_actor type do
    actor_def actor
  end
end


