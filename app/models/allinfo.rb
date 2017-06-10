class Allinfo < ActiveRecord::Base
  belongs_to :user
  has_many :oneinfo
  validates :title, :price, :max, :url, :user_id, :presence => true
end
