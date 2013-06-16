class PagesController < ApplicationController
  def home
    @achieved_achievements = AchievedAchievement.all
  end

  def status
    @achievements = Achievement.all
    @kard = YetAnotherKard.find_by_uid params[:yak_uid]
    @kard = YetAnotherKard.new if @kard.nil?
  end
end
