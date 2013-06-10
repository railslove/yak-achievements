class YetAnotherKard < ActiveRecord::Base
  has_many :achieved_achievements
  has_many :achievements, through: :achieved_achievements

  has_many :checkins, class_name: "KardCheckin"
  has_many :resources, through: :checkins

  attr_accessible :uid

  validates :uid, presence: true, uniqueness: true
end
