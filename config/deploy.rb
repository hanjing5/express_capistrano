#config/deploy.rb

# AUTHOR: Han Jing

# REFERENCE
# see https://help.github.com/articles/deploying-with-capistrano
# on how to deploy with github and capistrano
#
#TODO: SET application name
set :application, ""

#TODO: SET repo name
set :repository, 'git@github.com:whatever.git'

#TODO: SET user
set :user, ''

#TODO: SET server address
set :address, ""

#TODO: This could be app.js or whatever you use to launch the express app
set :main_js, ""

#TODO: use `which forever` to figure this out
#set :forever_cmd, "/usr/local/bin/forever"
set :forever_cmd, ""

ssh_options[:forward_agent] = true
set :scm, :git                                      #capper default
set :use_sudo, false                                #capper default
set :keep_releases, 15                               #capper default
set :deploy_via, :remote_cache                      #capper default

# your log folder to share between different releases
# you can add more folders here...
set :symlinks, {"log" => "log"}

# We use two different stages here production / staging
desc "production stage"
task :production do
# skip using nave on production server
  set :use_nave, false
  set :branch, 'master'                                     #default

  set :deploy_to , "/home/#{user}/#{application}"   #capper defaults to "/var/app/#{application}"
  set :node_env, 'production'
  server address, :app                        #add more / different roles
  #set :forever_cmd, "/usr/local/bin/forever"           #use the forever that is installed along with the app
end

desc "staging stage"
task :staging do
  # use node 0.8.1. together with nave
  #set :node_ver, '0.8.1'

  # test a different branch on staging  
  #set :branch, 'node-0.8'
  set :deploy_to, "/home/#{user}/#{application}"
  set :node_env, 'staging'
  server address, :app
  #set :forever_cmd, "/usr/local/bin/forever"
end

desc "tail the application logfile"
task :log do
  log = "#{application_dir}/current/log/#{node_env}.log"
  run "tail -f #{log}"
end
