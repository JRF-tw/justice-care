require "rails_helper"

describe User do
  let(:user) {FactoryBot.create(:user)}

  it "#factory_creat_success" do
    expect {
      FactoryBot.create :user
    }.to change { User.count }.by(1)
  end

  it "#factory_creat_admin_success" do
    expect {
      FactoryBot.create :admin
    }.to change { User.count }.by(1)
  end

  describe ".ransackable_attributes" do
    it "exposes only non-sensitive columns to Ransack" do
      allowed = User.ransackable_attributes
      expect(allowed).to include("email", "name", "admin")
      expect(allowed).not_to include(
        "encrypted_password", "reset_password_token",
        "unlock_token", "confirmation_token"
      )
    end

    it "exposes no associations to Ransack" do
      expect(User.ransackable_associations).to eq([])
    end
  end
end