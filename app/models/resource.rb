class Resource < ActiveRecord::Base
  has_many :achievements

  attr_accessible :key

  validates :key, presence: true, uniqueness: true
end
