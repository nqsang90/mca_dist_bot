#
# Cookbook Name:: mca_dist_bot
# Recipe:: trungtamnuochoa.com
#
# Copyright 2013, MobiVi Inc
#
# All rights reserved - Do Not Redistribute
#

mca_dist_bot "trungtamnuochoa.com" do
	provider ({
		"id" => node['mca_dist_bot']['trungtamnuochoa.com']['provider_id'],
		"name" => node['mca_dist_bot']['trungtamnuochoa.com']['ewallet'],
		"jar-path" => "/bots/trungtamnuochoa.com/ttnuochoa-#{node['mca_dist_bot']['trungtamnuochoa.com']['version']}.jar",
		"loading-class" => 'vn.mobivi.inventory.crawler.bot.ttnuochoa.Bot',
		"parsing-class" => 'vn.mobivi.inventory.crawler.bot.ttnuochoa.Parser',
		"properties" => {
			"crawl-url" => node['mca_dist_bot']['trungtamnuochoa.com']['crawl_url'],
			"discount" => node['mca_dist_bot']['trungtamnuochoa.com']['discount'] || 12,
			"default-quantity" => node['mca_dist_bot']['trungtamnuochoa.com']['default_quantity'] || 10,
			"dispatcher" => 'default-join',
			"max-routes" => 10,
			"page-load-timeout" => 300000
		}
	})
end



