require 'capistrano/node-deploy'

# the name
set :application ''
# repo address git@github.com:whatever.git'
set :repository ''
set :user, ''
set :scm, :git
set :deploy_to, "/home/#{user}/#{application}"

# server name
role :app, '"
