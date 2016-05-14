# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# env :PATH, ENV['PATH']
env :PATH, '/usr/local/rvm/gems/ruby-2.2-head/bin:/usr/local/rvm/gems/ruby-2.2-head@global/bin:/usr/local/rvm/rubies/ruby-2.2-head/bin:/usr/local/node/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/rvm/bin'

set :output, 'log/cron.log'

every 1.day, :at => '1:00 am' do
  rake "problem:sync_votes_count"
end