include_recipe 'common::default'
include_recipe 'etcd::default'
include_recipe 'postgresql::default'
include_recipe 'keepalived::default'

postgresql_role 'pdns' do
  login true
  superuser false
  replication false
  createdb true
  roles []
  action :create
end

postgresql_role 'cinc' do
  login true
  superuser false
  replication false
  createdb true
  roles []
  action :create
end