class Userbook < ActiveRecord::Base
  belongs_to :user
  validates :title, :body, :desc, :user_id, :presence => true
end
