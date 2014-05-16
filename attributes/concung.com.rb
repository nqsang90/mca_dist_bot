default['mca_dist_bot']['concung.com']['provider_id'] = 8
default['mca_dist_bot']['concung.com']['version'] = '0.0.1'
default['mca_dist_bot']['concung.com']['package'] = 'mca/inventory/concung'
default['mca_dist_bot']['concung.com']['check_deploy'] = "concung-#{node['mca_dist_bot']['concung.com']['version']}.jar"
default['mca_dist_bot']['concung.com']['web_url'] = 'http://concung.com'
default['mca_dist_bot']['concung.com']['crawl_url'] = 'http://concung.com/mobivi/data/product.json.gz'
default['mca_dist_bot']['concung.com']['ewallet'] = 'concung-mca'
default['mca_dist_bot']['concung.com']['msin_prefix'] = 'CONCUNG-'
default['mca_dist_bot']['concung.com']['item_hide_missing'] = 'true'
default['mca_dist_bot']['concung.com']['discount'] = 10
default['mca_dist_bot']['concung.com']['cron']['hour'] = "11,23"
default['mca_dist_bot']['concung.com']['cron']['minute'] = "0"
default['mca_dist_bot']['concung.com']['min_sku_number'] = 0