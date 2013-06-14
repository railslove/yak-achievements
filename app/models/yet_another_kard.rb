class YetAnotherKard < ActiveRecord::Base
  has_many :achieved_achievements, dependent: :destroy
  has_many :achievements, through: :achieved_achievements, dependent: :destroy

  has_many :checkins, class_name: "KardCheckin", dependent: :destroy
  has_many :resources, through: :checkins, dependent: :destroy

  attr_accessible :uid

  validates :uid, presence: true, uniqueness: true
end
