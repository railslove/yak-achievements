class PagesController < ApplicationController
  def home
    @achieved_achievements = AchievedAchievement.last(5)

    @coffee = Resource.find_by_short("coffee").absolute_numbers_for_today
    @meat = Resource.find_by_short("meat").absolute_numbers_for_today
    @veggie = Resource.find_by_short("veggie").absolute_numbers_for_today
  end

  def status
    @achievements = Achievement.all
    @kard = YetAnotherKard.find_by_uid params[:yak_uid]
    @kard = YetAnotherKard.new if @kard.nil?
  end
end
