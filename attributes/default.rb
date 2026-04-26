override['patroni']['nodes'] = [
  "01.pg-common.db.east.local",
  "02.pg-common.db.east.local",
  "03.pg-common.db.east.local"
]

override['etcd']['pki']['mount'] = 'pki-pg-common'
override['etcd']['pki']['role'] = 'main'
override['postgresql']['pki'] = {
  'mount' => 'pki-pg-common',
  'role' => 'main',
}

initial_cluster = node['patroni']['nodes']
                  .map { |node| "#{node}=https://#{node}:2380" }
                  .join(',')

override['etcd']['initial_cluster'] = initial_cluster
override['patroni']['etcd']['hosts'] = node['patroni']['nodes'].map { |n| "#{n}:2379" }
override['patroni']['scope'] = 'pg-common-east'