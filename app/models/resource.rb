class Resource < ActiveRecord::Base
  has_many :achievements

  has_many :kard_checkins
  has_many :yet_another_kards, through: :kard_checkins

  attr_accessible :key

  validates :key, presence: true, uniqueness: true
end
