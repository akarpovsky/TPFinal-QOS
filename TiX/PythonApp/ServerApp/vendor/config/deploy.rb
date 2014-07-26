lock '3.2.1'

set :application, 'tix_production'
set :repo_url, 'git@github.com:akarpovsky/TPFinal-QOS.git'
set :format, :pretty
set :log_level, :debug
set :pty, true
set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'

  task :copy_files do
    on roles(:app), in: :sequence, wait: 5 do
      execute "mkdir -p #{fetch(:install_to)} || true"
      execute "cp -rv #{fetch(:deploy_to)}/current/TiX/PythonApp/ServerApp/* #{fetch(:install_to)}"
    end
  end

  after :publishing, :copy_files

  after :copy_files, :restart_instance do
    on roles(:app) do
    end
  end
end
