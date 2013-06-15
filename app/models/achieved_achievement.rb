class AchievedAchievement < ActiveRecord::Base
  belongs_to :achievement
  belongs_to :yet_another_kard
end
