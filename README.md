# README

Rails 4 ressource management / calendar application

### System dependencies
* Ruby 2.0.0p481
* Rails 4.1.5
* Nodejs

### Configuration
* Install gems: `bundle install`

### Database setup
* Setup database and import dummy content from seeds.rb: `bundle exec rake db:migrate`

### Deployment instructions
* Install gems: `bundle install --deployment --without development`
* Setup database: `bundle exec rake db:setup RAILS_ENV=production`
* Import dummy data `bundle exec rake db:seed RAILS_ENV=production`
* `bundle exec rake assets:precompile RAILS_ENV=production`

### Production Server
* edit thin-config.yml
* `bundle exec thin {start|stop|restart} -C config/thin-config.yml`


## TODO

* Color-shading for project colors
* User authentication
* Date repeat
* Some projects should have multiple departments
* Making ressource and project name unique
* Adding reccource and project initials
* <s>Show project name on hover</s>
* <s>Delete job when its project or ressource gets deleted</s>
