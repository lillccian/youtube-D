class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable,
	       :omniauthable, :omniauth_providers => [:facebook]
  has_many :songs
  has_many :ytlinks
  has_many :comments
  has_many :keeps
  has_many :keepedusers , :through => :keeps, :source=> "song"
  has_many :likes
  has_many :likedusers , :through => :likes, :source=> "song"
  def admin?
    self.role == "admin"
  end
  def self.from_omniauth(auth)
     # Case 1: Find existing user by facebook uid
     user = User.find_by_fb_uid( auth.uid )
     if user
        user.fb_token = auth.credentials.token
        #user.fb_raw_data = auth
        user.name = auth.info.name
        user.photo = auth.info.image
        user.save!
       return user
     end

     # Case 2: Find existing user by email
     existing_user = User.find_by_email( auth.info.email )
     if existing_user
       existing_user.fb_uid = auth.uid
       existing_user.fb_token = auth.credentials.token
       #existing_user.fb_raw_data = auth
       existing_user.save!
       return existing_user
     end

     # Case 3: Create new password
     user = User.new
     user.fb_uid = auth.uid
     user.fb_token = auth.credentials.token
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     #user.fb_raw_data = auth
     user.photo = auth.info.image
     user.save!
     return user
  end
  def name?
    self.name||self.nickname||self.email
  end
end
