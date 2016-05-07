# /lib/tasks/problem.rake
namespace :problem do

  desc "Sync votes count cache"
  task sync_votes_count: :environment do
    puts "Syncing problem votes cache..."
    Problem.all.each do |problem|
      puts "Problem id #{problem.id} total_votes_cache #{problem.total_votes_cache} recently_votes_cache #{problem.recently_votes_cache}"
      problem.sync_votes_count
      problem.reload
      puts "Problem id #{problem.id} total_votes_cache #{problem.total_votes_cache} recently_votes_cache #{problem.recently_votes_cache}"
    end
    puts "Sync done!"
  end
end