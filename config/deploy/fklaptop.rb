server '10.1.2.184', user: 'zeus', roles: %w{web app db},
  ssh_options: {
    forward_agent: true,
    auth_methods: ['publickey'],
    port: 22
  }

set :deploy_to, '/home/zeus/app'
set :branch, 'dont-merge/offline-scanning-without-authentication'
set :rails_env, 'production'
set :unicorn_pid, '/var/run/unicorn/gandalf.pid'
