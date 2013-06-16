class PagesController < ApplicationController
  def home
    @achieved_achievements = AchievedAchievement.last(5)
    @drinks = Resource.find_by_name("Coffee and other Drinks").absolute_numbers_for_today
  end

  def status
    @achievements = Achievement.all
    @kard = YetAnotherKard.find_by_uid params[:yak_uid]
    @kard = YetAnotherKard.new if @kard.nil?
  end
end
