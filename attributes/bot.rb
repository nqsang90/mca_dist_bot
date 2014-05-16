
default['mca_dist_bot']['actors']['bot']['package'] = 'mca/inventory/node-bot'
default['mca_dist_bot']['actors']['bot']['version'] = '0.0.3-bin-r1'
default['mca_dist_bot']['actors']['bot']['bot_dir'] = "#{node['mca_dist_bot']['dir']}/bots"
default['mca_dist_bot']['actors']['bot']['port'] = 2020
default['mca_dist_bot']['actors']['bot']['bot_ports']['min'] = 2000
default['mca_dist_bot']['actors']['bot']['bot_ports']['max'] = 3000

default['mca_dist_bot']['actors']['bot']['confs'] = {
  'data-normalization.conf' => {
    'discount_default' => 10,
    'quantity_default' => 10,
    'convert.command' => '/usr/bin/convert',
    'image.url' => 'https://d77lg11wtf7h2.cloudfront.net/_developer/inv/',
    'image.localpath' => '/opt/inventory/crawler/tuanta/temp/',
    'inventory.conn.url' => 'http://10.120.29.99:8181/inventory/soap/inventory-api',
    'inventory.conn.timeout'  => 10000
  }
}
