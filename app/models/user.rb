class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  VALID_PHONE_REGEX = /\A0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}\z/
  validates :phone, format: { with: VALID_PHONE_REGEX }

  def email_required?
    false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end
end
