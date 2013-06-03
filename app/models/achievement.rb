class Achievement < ActiveRecord::Base
  acts_as_nested_set

  belongs_to :resource

  has_many :achieved_achievements
  has_many :squid_cards, through: :achieved_achievements

  attr_accessible :title, :resource

  validates :title,     presence: true, uniqueness: true
  validates :resource,  presence: true
end
