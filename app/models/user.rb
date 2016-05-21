class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:instagram]
         
         
  def self.find_for_oauth(auth)
    p auth.uid
    p auth.provider
    user = User.where(uid: auth.uid, provider: auth.provider).first

    # unless user
    #   user = User.create(
    #     uid: auth.uid,
    #     provider: auth.provider,
    #     email: "",
    #     password: Devise.friendly_token[0, 20]
    #   )
    # end
  end
end
