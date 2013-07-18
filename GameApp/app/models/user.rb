class User < ActiveRecord::Base
  has_secure_password

  has_many :playings
  has_many :games, through: :playings

  before_save :ensure_has_role

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  attr_accessible :bio, :email, :first_name, :last_name, :password, :password_confirmation, :user_gender, :user_picture, :username, :playings

  mount_uploader :user_picture, UserPictureUploader


  def role? role
    self.role == role
  end

  def ensure_has_role
    self.role ||= "user"
    # self.role = "user" if self.role == nil ---> other way to do it!
  end

  def self.computer_id
    user_object = where(username: "Computer" ).first
    user_object.id if user_object
  end


end



