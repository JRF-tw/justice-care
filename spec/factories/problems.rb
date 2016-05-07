FactoryGirl.define do
  factory :problem do
    sequence(:title)  { |n| "Problem title #{n}" }
    sequence(:content)  { |n| "Problem content #{n}" }
    link ""
    add 0
    total_votes_cache 0
    recently_votes_cache 0
  end
end
