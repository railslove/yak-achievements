class Achievement < ActiveRecord::Base
  ACHIEVEMENT_TYPES = %w[counter]

  serialize :settings

  belongs_to :resource

  has_many :achieved_achievements
  has_many :yet_another_kards, through: :achieved_achievements

  attr_accessible :title, :resource, :description, :settings, :achievement_type

  validates :title,     presence: true, uniqueness: true
  validates :resource,  presence: true
  validates :achievement_type,      presence: true, inclusion: {in: ACHIEVEMENT_TYPES}

  def process_achievement(yak)
    self.send "process_#{achievement_type}", yak
  end

  protected

  def process_counter(yak)
    return if self.yet_another_kards.include? yak

    if settings.present? and settings[:count].present?
      logger.info "Achievement Process! #{self.title} -> #{yak.uid} -> #{self.resource.yet_another_kards.where(id: yak.id).count}/#{settings[:count]}"

      # Unlocks achievement if Counter-Limit is hit
      if self.resource.yet_another_kards.where(id: yak.id).count == settings[:count]
        self.yet_another_kards << yak
        logger.info "Achievement UNLOCKED! #{self.title} -> #{yak.uid}"
      end
    else
      # Counter, but no Count-Limit given => first occurens unlocks achievement
      logger.info "Achievement UNLOCKED! #{self.title} -> #{yak.uid}"
      self.yet_another_kards << yak
    end
  end
end
