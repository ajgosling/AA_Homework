# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  
  validates :password, length: {minimum: 6, allow_nil: true}
  
  attr_reader :password
  
  after_initialize :ensure_session_token
  
  has_many :links,
    foreign_key: :user_id,
    class_name: :Link
  
  has_many :comments,
    through: :links,
    source: :comments
  
  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    if user && user.is_password?(pw)
      user
    else
      nil
    end
  end
  
  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
  
  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save!
    self.session_token
  end 
  
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64

  end 
end
