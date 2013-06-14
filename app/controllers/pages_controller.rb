class PagesController < ApplicationController
  def home
    @achieved_achievements = AchievedAchievement.last(5)
  end
end
