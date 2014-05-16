#
# Cookbook Name:: mca_dist_bot
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# deploy main bot source
mca_release = search(:node, "mca_release:http_port").first
tarpath = "#{Chef::Config[:file_cache_path]}/mca-bot-core-#{node['mca_dist_bot']['core']['version']}.tgz"

# create user&group
group node['mca_dist_bot']['group']
user node['mca_dist_bot']['user'] do
  gid node['mca_dist_bot']['group']
end

# prepare a parent directory for all actors & bots
directory node['mca_dist_bot']['dir'] do
  recursive true
  owner node['mca_dist_bot']['user']
  group node['mca_dist_bot']['group']
end


