class YetAnotherKard < ActiveRecord::Base
  has_many :achieved_achievements, dependent: :destroy
  has_many :achievements, through: :achieved_achievements

  has_many :checkins, class_name: "KardCheckin", dependent: :destroy
  has_many :resources, through: :checkins

  attr_accessible :uid

  validates :uid, presence: true, uniqueness: true

  def resource_checkins(target_resources)
    checkins = self.resources.where('resources.id' => target_resources)
  end
end
