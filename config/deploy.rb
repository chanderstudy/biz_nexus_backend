# config valid for current version and patch releases of Capistrano
lock "~> 3.19.1"
require 'capistrano/rvm'

set :application, "biz_nexus_backend"
set :repo_url, "https://prince4449:#{ENV['GITHUB_TOKEN']}@github.com/chanderstudy/biz_nexus_backend-.git"
set :puma_conf, "#{current_path}/config/puma.rb"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/ubuntu/biz_nexus_backend"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/credentials/production.key"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor","storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :app do
	task :puma_restart do
		on roles(:app) do
		  sudo 'stop puma || true'
		  sudo 'start puma || true'
		end
	end
end

after 'deploy:cleanup', 'app:puma_restart'

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

