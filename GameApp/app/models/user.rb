class User < ActiveRecord::Base
  has_secure_password

  has_many :playing
  has_many :games, through: :playings

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  attr_accessible :bio, :email, :first_name, :last_name, :password, :password_confirmation, :user_gender, :user_picture, :username


  def role? role
    self.role == role
  end

end



