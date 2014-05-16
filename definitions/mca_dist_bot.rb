
#
# Cookbook Name:: mca_dist_bot
#
# Copyright 2013, MobiVi, inc
#
# All rights reserved - Do Not Redistribute
#
# - Download and extract bot package
# - Create context.xml for the bot
#

define :mca_dist_bot, 
  :cookbook => "mca_dist_bot",
  :provider => {},
  :confs => {} do
  
  mparams = params;
  bot_def = node[params[:cookbook]][params[:name]]
  mbotname = bot_def['botname'] || params[:name]
  mprovider = bot_def['provider_id'] || 0
  mweburl = bot_def['web_url'] || "http://noweb.com"
  deployed = File.exists?("#{node[:mca_dist_botexec][:bot_dir]}/bots/#{mbotname}/#{bot_def['check_deploy'] || ''}")
  
  botdir = "#{node[:mca_dist_botexec][:bot_dir]}/bots/#{mbotname}"
  tarpath = "#{Chef::Config[:file_cache_path]}/mca-#{mbotname}-#{bot_def['version']}.tgz"

  # create user
    bot_user = "bot_#{mbotname.gsub(".", "_")}"
    user bot_user do
      gid node['mca_dist_botexec']['group']
    end
    
  # create botdir directory
    directory botdir do
      owner node["mca_dist_botexec"]["user"]
      group node["mca_dist_botexec"]["group"]
      mode 0775
    end
  unless deployed
    mca_release = search(:node, "mca_release:http_port").first
    
    remote_file tarpath do
      source "http://#{mca_release['fqdn']}:#{mca_release['mca_release']['http_port']}/#{bot_def['package']}/#{bot_def['version']}.tgz"
      mode 00644
      action :create
    end
  
    execute "clean-and-untar-#{mbotname}-archive" do 
      cwd botdir
      command "rm -rf ./* && /bin/tar xzf #{tarpath}"
      user node['mca_dist_botexec']['user']
      group node['mca_dist_botexec']['group']
    end
  end
      
  ["bin", "config"].each do |dirname|
    directory "#{botdir}/#{dirname}" do
      owner node['mca_dist_botexec']['user']
      group node['mca_dist_botexec']['group']
      mode 0775
      recursive true
      action :create
    end
  end
  
  require 'rexml/text' unless defined? REXML::Text
  
  provider = mparams[:provider]
  provider_props = {
          "url" => bot_def['web_url'],
          "msin-prefix" => bot_def['msin_prefix'] || ("TG#{bot_def['provider_id']}-"),
        }.merge(provider['properties'] || {})
  provider_props.keys.each do |prop| 
  # escape string value to put into xml
    provider_props[prop] = REXML::Text.new("#{provider_props[prop]}", false, nil, false ).to_s()
  end
  provider['properties'] = provider_props
  
  template "#{botdir}/context.xml" do
    source "context.xml.erb"
    owner node['mca_dist_botexec']['user']
    group node['mca_dist_botexec']['group']
    mode 0644
    variables({
        "status" => bot_def['item_status'] || "enabled",
        "validate_sku" => bot_def['item_validate_sku'] || true,
        "min_sku_number" => bot_def['min_sku_number'] || 0,
        "delete_inv" => bot_def['item_hide_missing'] || 0,
        "provider" => provider
    })
  end
  # schedule cron
  bot_cron = params[:crondef] || {}
  cron_d "mca_#{bot_user}" do
    action (bot_cron.empty? || bot_cron[:disabled] || node['mca_dist_botexec']['disable_all'])? :delete : :create
    minute bot_cron['minute'] || "0"
    hour bot_cron['hour'] || "0"
    user 'root'
    shell '/bin/sh'
    path '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin'
    command "#{node[:mca_dist_botexec][:botdir]}/local-bot/bot.sh start #{mbotname} #{params[:provider_id]} >> #{node[:mca_dist_botexec][:log_dir]}/#{params[:name]}/cron.log"
  end
end
