require "rails_helper"

describe Vote do
  let(:vote) {FactoryBot.create(:vote)}

  it "#factory_creat_success" do
    expect {
      FactoryBot.create :vote
    }.to change { Vote.count }.by(1)
  end
end