class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates_presence_of :email
  has_many :votes
  has_many :problems, -> { distinct }, through: :votes

  # Ransack 2+ still exposes every column by default; restrict the admin user
  # search to non-sensitive fields so attackers can't probe password/token columns.
  def self.ransackable_attributes(_auth_object = nil)
    %w[id name email admin is_legal_profession accept_contact provider created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, provider_uid: auth.uid).first
    if user
      return user
    else
      registered_user = User.where(email: auth.info.email).first
      if registered_user
        registered_user.provider = auth.provider
        registered_user.provider_uid = auth.uid
        registered_user.save
        return registered_user
      else
        user = User.new(name: auth.info.name,
          provider: auth.provider,
          provider_uid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0,20]
        )
        return user
      end
    end
  end

  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    data = auth.info
    user = User.where(provider: auth.provider, provider_uid: auth.uid ).first
    if user
      return user
    else
      registered_user = User.where(email: auth.info.email).first
      if registered_user
        registered_user.provider = auth.provider
        registered_user.provider_uid = auth.uid
        registered_user.save
        return registered_user
      else
        user = User.new(name: data["name"],
          provider: auth.provider,
          email: data["email"],
          provider_uid: auth.uid ,
          password: Devise.friendly_token[0,20]
        )
        return user
      end
    end
  end
end
