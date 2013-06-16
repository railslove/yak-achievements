class AchievementResource < ActiveRecord::Base
  belongs_to :achievement
  belongs_to :resource
end
