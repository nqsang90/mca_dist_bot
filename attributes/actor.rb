


default['mca_dist_bot']['actors']['download']['package'] = 'mca/inventory/node-download'
default['mca_dist_bot']['actors']['download']['version'] = '0.0.6-bin-r1'
default['mca_dist_bot']['actors']['download']['instances'] = {
}

default['mca_dist_bot']['actors']['fetch']['package'] = 'mca/inventory/node-fetch'
default['mca_dist_bot']['actors']['fetch']['version'] = '0.0.6-bin-r1'
default['mca_dist_bot']['actors']['fetch']['instances'] = {
}

default['mca_dist_bot']['actors']['checksum']['package'] = 'mca/inventory/node-checksum'
default['mca_dist_bot']['actors']['checksum']['version'] = '0.0.6-bin-r1'
default['mca_dist_bot']['actors']['checksum']['instances'] = {}

default['mca_dist_bot']['actors']['convert_image']['package'] = 'mca/inventory/node-convert_image'
default['mca_dist_bot']['actors']['convert_image']['version'] = '0.0.6-bin-r1'
default['mca_dist_bot']['actors']['convert_image']['instances'] = {}

default['mca_dist_bot']['actors']['convert_item']['package'] = 'mca/inventory/node-convert_item'
default['mca_dist_bot']['actors']['convert_item']['version'] = '0.0.6-bin-r1'
default['mca_dist_bot']['actors']['convert_item']['instances'] = {}

default['mca_dist_bot']['actors']['upload_image']['package'] = 'mca/inventory/node-upload_image'
default['mca_dist_bot']['actors']['upload_image']['version'] = '0.0.6-bin-r1'
default['mca_dist_bot']['actors']['upload_image']['instances'] = {}



=begin
# example definitions
default['mca_dist_bot']['actors']['parsers'] = {
		'parserA' => {'port' => 5000, 'num_actors' => 1, 'max_routes' => 20}
	}
default['mca_dist_bot']['actors']['writers'] = {
		'writerA' => {'port' => 6000, 'num_actors' => 1, 'max_routes' => 20}
	}
default['mca_dist_bot']['actors']['downloaders'] = {
		'downloaderA' => {'port' => 7000, 'num_actors' => 1, 'max_routes' => 20}
	}
default['mca_dist_bot']['actors']['crawlers'] = {
		'crawlerA' => {'port' => 8000, 'bots' => %w{uma.vn}}
	}
=end