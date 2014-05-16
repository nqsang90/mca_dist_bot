
# actor_def includes:
# dir
# package
# version
#
def bot_actor :cookbook => 'mca_dist_bot', :actor_def => {} do
  actor_def = params[:actor_def].dup
  actor_name = actor_def[:name] || params[:name]

  # download & extract
  mca_release = search(:node, "mca_release:http_port").first
  ark "download & extract #{actor_name}-#{actor_def[:version]}" do
    url "http://#{mca_release['fqdn']}:#{mca_release['mca_release']['port']}/#{actor_def[:package]}/#{actor_def[:version]}.tgz"
    path actor_def[:path]
    owner actor_def[:user]
    action :put
  end

  # prepare directory
  ['bin', 'conf', 'res/nodes'].each |dir| do
    directory "#{actor_def[:path]}/#{dir}" do
      recursive true
      owner actor_def[:user]
      group actor_def[:group]
    end
  end

  # context
  actor_def[:instances].each |name, instance| do
    template "#{actor_def[:path]}/res/nodes/#{name}.xml" do
      source 'common_actor_context.xml.erb'
      variables(
        :name => name,
        :channel => instance['channel'],
        :storage_path => instance['storage_path'],
        :storage_props => instance['storage_props'],
        :node_type => instance['node_type'],
        :port => instance['port'],
        :subscribers => instance['subscribers'] || {},
        :props => instance['props']
      )
      cookbook params[:cookbook]
      owner actor_def[:user]
      group actor_def[:group]
      mode 0644
    end
  end

  # create start script
  template "#{actor_def[:path]}/bin/start.sh" do
    source 'common_actor_start.sh.erb'
    cookbook params[:cookbook]
    owner actor_def[:user]
    group actor_def[:group]
    mode 0755
  end

  # daemonize script
  template "#{actor_def[:path]}/bin/daemonize.sh" do
    source 'common_actor_daemonize.sh.erb'
    cookbook params[:cookbook]
    owner 'root'
    group 'root'
    mode 0755
  end
end
