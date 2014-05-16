#
# Cookbook Name:: mca_dist_bot
# Recipe:: hoagaubong
#
# Copyright 2013, MobiVi Inc
#
# All rights reserved - Do Not Redistribute
#

mca_dist_bot "hoagaubong" do
  provider ({
	"id" => node['mca_dist_bot']['hoagaubong']['provider_id'],
	"name" => node['mca_dist_bot']['hoagaubong']['ewallet'],
	"jar-path" => "/bots/hoagaubong/hoagaubong-#{node['mca_dist_bot']['hoagaubong']['version']}.jar",
	"loading-class" => 'vn.mobivi.inventory.crawler.bot.hoagaubong.Bot',
	"parsing-class" => 'vn.mobivi.inventory.crawler.bot.hoagaubong.Parser',
	"properties" => {
		"crawl-url" => node['mca_dist_bot']['hoagaubong']['crawl_url'],
		"discount" => node['mca_dist_bot']['hoagaubong']['discount'] || 12,
		"default-quantity" => node['mca_dist_bot']['hoagaubong']['default_quantity'] || 10,
		"dispatcher" => 'default-join',
		"max-routes" => 10,
		"page-load-timeout" => 300000
	}
  })
end



