# README

URL Shortner App

#Versions
Ruby 2.5.1
Rails 5.2.4.4
SQlite DB

#Setup

# use gemset
rvm use 2.5.1@short_url

# install gems
bundle install

# db setup
rake db:create
rake db:migrate
rake db:seed

# to run the specs
rspec spec

# to run the server
rails s

1. Stats page (http://localhost:3000/stats). You will see sample data loaded from seeds.rb file
2. Home Page (http://localhost:3000)



