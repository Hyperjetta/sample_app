set :application, "Sample"

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:Hyperjetta/sample_app.git"  # Your clone URL
set :scm, "git"
set :user, "deployer"  # The server's user for deploys
set :scm_passphrase, "p@ssw0rd"  # The deploy user's password

role :web, "psfspider.com"                          # Your HTTP server, Apache/etc
role :app, "psfspider.com"                          # This may be the same as your `Web` server
role :db,  "psfspider.com", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end