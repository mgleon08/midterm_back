class Disaster < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :category
  has_many :disaster_comments
end
