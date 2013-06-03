class SquidCard < ActiveRecord::Base
  has_many :achieved_achievements
  has_many :achievements, through: :achieved_achievements

  attr_accessible :uid

  validates :uid, presence: true, uniqueness: true
end
