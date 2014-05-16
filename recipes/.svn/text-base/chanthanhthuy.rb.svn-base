#
# Cookbook Name:: mca_dist_bot
# Recipe:: chanthanhthuy
#
# Copyright 2013, MobiVi Inc
#
# All rights reserved - Do Not Redistribute
#

mca_dist_bot "chanthanhthuy" do
  provider ({
	"id" => node['mca_dist_bot']['chanthanhthuy']['provider_id'],
	"name" => node['mca_dist_bot']['chanthanhthuy']['ewallet'],
	"jar-path" => "/bots/chanthanhthuy/chanrathanhthuy-#{node['mca_dist_bot']['chanthanhthuy']['version']}.jar",
	"loading-class" => 'vn.mobivi.inventory.crawler.bot.chanrathanhthuy.Bot',
	"parsing-class" => 'vn.mobivi.inventory.crawler.bot.chanrathanhthuy.Parser',
	"properties" => {
		"crawl-url" => node['mca_dist_bot']['chanthanhthuy']['crawl_url'],
		"discount" => node['mca_dist_bot']['chanthanhthuy']['discount'] || 12,
		"default-quantity" => node['mca_dist_bot']['chanthanhthuy']['default_quantity'] || 10,
		"dispatcher" => 'default-join',
		"max-routes" => 10,
		"page-load-timeout" => 300000
	}
  })
end



