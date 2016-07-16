FactoryGirl.define do
  factory :analysis do
    sequence(:title)  { |n| "Analysis title #{n}" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    sequence(:content)  { |n| "Analysis content #{n}" }
    mindmap_url ""
    youtube_url ""
    discourse_url ""
    sequence(:no) { |n| n }
  end
end
