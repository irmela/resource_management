# README

* Rails 4 ressource management / calendar application.
* Design based on bootstrap
* User authentication with devise. Currently only implemented redmine-omniauth.

![Screenshot 1](https://github.com/irmela/resource_management/blob/master/screenshot1.png)

### System dependencies
* Ruby 2.3.1
* Rails 4.2.7.1

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
* Some projects should have multiple departments
* Making resource and project name unique
* Adding resource and project initials
* <s>Show project name on hover</s>
* <s>Delete job when its project or ressource gets deleted</s>
* <s>User authentication</s>
* <s>Date repeat</s>
* <s>History</s>
