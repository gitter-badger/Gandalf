threads 0,8
workers 4

environment 'production'
daemonize
pidfile 'tmp/puma.pid'

preload_app!

bind 'unix:///var/run/unicorn/puma.sock'

on_worker_boot do
  ActiveRecord::Base.connection_pool.disconnect!

  ActiveSupport.on_load(:active_record) do
    Activerecord::Base.establish_connection
  end
end


