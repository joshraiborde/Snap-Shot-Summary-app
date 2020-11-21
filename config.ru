require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#it's where you'll mount other controllers using the keyword 'use'

#to send PATCH and DELETE requests
#'use RACK::MethodOverride'
use UserController
use PostsController

run ApplicationController
