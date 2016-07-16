FactoryGirl.define do
  factory :report do
    analysis {FactoryGirl.create(:analysis)}
    sequence(:title)  { |n| "Report title #{n}" }
    sequence(:content)  { |n| "Report content #{n}" }
    sequence(:no) { |n| n }
    discourse_url ""
    mindmap_url ""
  end
end
