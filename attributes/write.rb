default['mca_dist_bot']['write']['package'] = 'mca/inventory/node-write'
default['mca_dist_bot']['write']['version'] = '0.0.6-bin-r1'
default['mca_dist_bot']['write']['instances'] = {
  'parserA' => {'port' => 4040, 'num_actors' => 1, 'max_routes' => 20}
}