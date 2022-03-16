# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"

set :application, "expt"
set :repo_url, "https://github.com/tarorin-work/expt1"

set :branch, 'main'

set :deploy_to, '/var/www/expt_app'

set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :keep_releases, 5

set :rbenv_ruby, '2.6.3'

set :log_level, :debug

namespace :deploy do
	desc 'Restart application'
	task :restart do
		invoke 'unicorn:restart'
	end

	desc 'Create database'
  	task :db_create do
    	on roles(:db) do |host|
      		with rails_env: fetch(:rails_env) do
        		within current_path do
                  sql = "CREATE DATABASE IF NOT EXISTS expt_app_production;"
                  execute "mysql --user=root --password='R|5f7.eP' -e '#{sql}'"
				end
			end
		end
	end

	after :publishing, :restart

	after :restart, :clear_cache do
		on roles(:web), in: :groups, limit: 3, wait: 10 do
		end
	end
end
