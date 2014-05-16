#
# Cookbook Name:: mca_dist_bot
# Recipe:: concung.com
#
# Copyright 2013, MobiVi Inc
#
# All rights reserved - Do Not Redistribute
#

mca_dist_bot "concung.com" do
  provider ({
	"id" => node['mca_dist_bot']['concung.com']['provider_id'],
	"name" => node['mca_dist_bot']['concung.com']['ewallet'],
  	"jar-path" => "/bots/concung.com/concung-#{node['mca_dist_bot']['concung.com']['version']}.jar",
	"loading-class" => 'vn.mobivi.inventory.crawler.bot.concung.Bot',
	"parsing-class" => 'vn.mobivi.inventory.crawler.bot.concung.Parser',
	"properties" => {
		"crawl-url" => node['mca_dist_bot']['concung.com']['crawl_url'],
		"discount" => node['mca_dist_bot']['concung.com']['discount'] || 12,
		"default-quantity" => node['mca_dist_bot']['concung.com']['default_quantity'] || 10,
		"dispatcher" => 'default-join',
		"max-routes" => 10,
		"page-load-timeout" => 300000
	}
  })
end



