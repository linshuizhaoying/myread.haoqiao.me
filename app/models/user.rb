class User < ActiveRecord::Base
  has_many :articles
  has_many :userbooks
  has_many :allinfos
  has_many :shares
  has_many :swaps
  has_many :letters
  
	has_secure_password
  #attr_accessible :email, :name, :password, :password_confirmation, :tokenend
	before_create { generate_token(:token) }

	validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :email, :presence => true, :uniqueness => {:case_sensitive => false}, :email_format => true
  validates :password, :length => { :minimum => 6 }, :on => :create

	def user_params 
	  params.require(:user).permit(:username, :email)
	end 

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end