require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #to send patch and delete requests

#to run application and other controllers
run ApplicationController
run StudentsController
