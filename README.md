#Deploy express with capistrano and forever

Set the variables in config/deploy.rb and run

    bundle exec cap #{environment} deploy

to deploy

If this is your first time deploying the app, you have to run

    bundle exec cap #{environment} deploy:setup
    bundle exec cap #{environment} deploy:cold
    
