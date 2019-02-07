class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :name, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  VALID_PHONE_REGEX = /\A0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}\z/
  validates :phone, format: { with: VALID_PHONE_REGEX }, allow_blank: true

  def email_required?
    false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      user.save(:validate => false)
    end

    user
  end

end
