FactoryGirl.define do
  factory :vote do
    user {FactoryGirl.create(:user)}
    problem {FactoryGirl.create(:problem)}
  end
end
