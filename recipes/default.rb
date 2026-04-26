include_recipe 'common::default'
include_recipe 'etcd::default'
include_recipe 'postgresql::default'


postgresql_role 'pdns' do
  login true
  superuser false
  replication false
  createdb true
  roles []   # если нет доп ролей
  action :create
end