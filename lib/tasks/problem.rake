# /lib/tasks/problem.rake
namespace :problem do

  desc "Sync votes count cache"
  task sync_votes_count: :environment do
    puts "Syncing problem votes cache..."
    Problem.all.each do |problem|
      problem.sync_votes_count
    end
    puts "Sync done!"
  end
end