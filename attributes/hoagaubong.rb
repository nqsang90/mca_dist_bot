default['mca_dist_bot']['hoagaubong']['provider_id'] = 23
default['mca_dist_bot']['hoagaubong']['version'] = '0.0.1'
default['mca_dist_bot']['hoagaubong']['package'] = 'mca/inventory/hoagaubong'
default['mca_dist_bot']['hoagaubong']['check_deploy'] = "hoagaubong-#{node['mca_dist_bot']['hoagaubong']['version']}.jar"
default['mca_dist_bot']['hoagaubong']['crawl_url'] = 'http://www.hoagaubong.com/hoa-gau-bong/product/menu/54-Tat-ca-San-Pham.html/0/40/DESC/'
default['mca_dist_bot']['hoagaubong']['ewallet'] = 'hoagaubong'
default['mca_dist_bot']['hoagaubong']['msin_prefix'] = 'HGBONG-'
default['mca_dist_bot']['hoagaubong']['item_hide_missing'] = 'true'
default['mca_dist_bot']['hoagaubong']['item_validate_sku'] = 'true'
default['mca_dist_bot']['hoagaubong']['discount'] = 10
default['mca_dist_bot']['hoagaubong']['cron']['hour'] = "9,21"
default['mca_dist_bot']['hoagaubong']['cron']['minute'] = "0"
default['mca_dist_bot']['hoagaubong']['min_sku_number'] = 150