require "rails_helper"

describe "Account lockout (Devise :lockable)" do
  let(:user) { FactoryBot.create(:user) }

  it "locks the account after too many failed sign-ins" do
    user
    Devise.maximum_attempts.times do
      post "/users/sign_in", params: { user: { email: user.email, password: "definitely-wrong" } }
    end

    expect(user.reload.access_locked?).to be true
  end

  it "does not lock the account on a successful sign-in" do
    sign_in(user)
    expect(user.reload.access_locked?).to be false
    sign_out
  end
end
