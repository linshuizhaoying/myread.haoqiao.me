class Oneinfo < ActiveRecord::Base
  belongs_to :allinfo
  validates :joined_id, :presence => true
end
