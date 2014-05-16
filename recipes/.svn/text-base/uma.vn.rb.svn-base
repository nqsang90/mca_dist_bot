


mca_dist_bot "uma.vn" do
  provider ({
	"id" => node['mca_dist_bot']['uma.vn']['provider_id'],
	"name" => node['mca_dist_bot']['uma.vn']['ewallet'],
	"jar-path" => "/bots/uma.vn/uma-#{node['mca_dist_bot']['uma.vn']['version']}.jar",
	"loading-class" => 'vn.mobivi.inventory.crawler.bot.uma.Bot',
	"parsing-class" => 'vn.mobivi.inventory.crawler.bot.uma.Parser',
	"properties" => {
		"crawl-url" => node['mca_dist_bot']['uma.vn']['crawl_url'],
		"discount" => node['mca_dist_bot']['uma.vn']['discount'] || 12,
		"default-quantity" => node['mca_dist_bot']['uma.vn']['default_quantity'] || 10,
		"dispatcher" => 'default-join',
		"max-routes" => 10,
		"page-load-timeout" => 300000
	}
  })
end

