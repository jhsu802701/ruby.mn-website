# Load heroku vars from local file
heroku_env = File.join(RAILS_ROOT, 'config', 'heroku_env.rb')
load(heroku_env) if File.exists?(heroku_env)
