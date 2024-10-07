#!/usr/bin/env puma
# frozen_string_literal: true

# Change the directory to your app directory
directory '/home/deploy/biz_nexus_backend/current'

# Path to your config.ru file
rackup '/home/deploy/biz_nexus_backend/current/config.ru'

# Set the environment to production
environment 'production'

# Tag (optional)
tag ''

# Path to the PID file
pidfile '/home/deploy/biz_nexus_backend/current/tmp/pids/puma.pid'

# Path to the state file
state_path '/home/deploy/biz_nexus_backend/current/tmp/pids/puma.state'

# Redirect STDOUT and STDERR to log files
stdout_redirect '/home/deploy/biz_nexus_backend/current/log/puma_access.log',
                '/home/deploy/biz_nexus_backend/current/log/puma_error.log', true

# Configure the number of threads
threads 2, 2

# Bind to the Unix socket
# bind 'unix:////home/deploy/digi_donation/shared/tmp/sockets/puma.sock'
bind 'tcp://127.0.0.1:9292'

# Number of worker processes
workers 5

# Restart command
restart_command 'bundle exec puma'

# Preload the application
preload_app!

# Before forking, disconnect the ActiveRecord connection pool
before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

# On worker boot, establish a new ActiveRecord connection
on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
