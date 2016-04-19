# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

reset = true

if reset

  problems = []

  Problem.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(Problem.table_name)

  problems.each do |p|
    problem = Problem.new(p)
    problem.id = p[:id]
    problem.save
  end

end