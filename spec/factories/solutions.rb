FactoryGirl.define do
  factory :solution do
    sequence(:title)  { |n| "Solution title #{n}" }
    sequence(:content)  { |n| "Solution content #{n}" }
    discourse_url ""
    sequence(:no) { |n| n }
  end
end
