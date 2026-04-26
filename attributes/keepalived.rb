default['keepalived']['global_router_id'] = node['ipaddress']

default['keepalived']['instance_name'] = 'VI_1'
default['keepalived']['interface'] = 'enp0s3'

default['keepalived']['virtual_router_id'] = 11
default['keepalived']['state'] = 'BACKUP'
default['keepalived']['priority'] = 100
default['keepalived']['nopreempt'] = true
default['keepalived']['advert_int'] = 1

default['keepalived']['auth_type'] = 'PASS'
default['keepalived']['auth_pass'] = '12345'

default['keepalived']['virtual_ipaddress'] = [
  '192.168.5.17/24 dev enp0s3'
]

default['keepalived']['virtual_routes'] = []

default['keepalived']['track_interfaces'] = %w(enp0s3)

default['keepalived']['check_scripts'] = {
  check_patroni_primary: {
    script: '/usr/bin/curl -sf --cert /etc/patroni/cert.pem --key /etc/patroni/key.pem --cacert /etc/patroni/ca.pem https://127.0.0.1:8008/primary',
    interval: 2,
    fall: 2,
    rise: 2,
    weight: 50,
    user: 'root'
  }
}