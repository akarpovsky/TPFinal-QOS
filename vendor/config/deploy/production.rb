# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{tix.innova-red.net}
role :web, %w{tix.innova-red.net}
role :db,  %w{tix.innova-red.net}

set :application, 'tix_production_releases'
set :deploy_to, "/home/pfitba/#{fetch(:application)}"
set :install_to, "/home/pfitba/#{fetch(:application).gsub(/_releases/,"")}"

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'tix.innova-red.net', user: 'pfitba', roles: %w{web app}

