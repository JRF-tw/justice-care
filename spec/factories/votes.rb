FactoryBot.define do
  factory :vote do
    user { FactoryBot.create(:user) }
    problem { FactoryBot.create(:problem) }
  end
end
