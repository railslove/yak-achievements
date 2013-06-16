# encoding: utf-8

class Resource < ActiveRecord::Base
  has_many :achievement_resources, dependent: :destroy
  has_many :achievements, through: :achievement_resources

  has_many :kard_checkins, dependent: :destroy
  has_many :yet_another_kards, through: :kard_checkins

  attr_accessible :key, :name

  before_validation :generate_key

  validates :key, presence: true, uniqueness: true
  validates :name, presence: true

  def absolute_numbers_for_today
    start_time = Date.today.to_time + 9.hours # 9 Uhr morgens
    end_time = Time.now + (59-Time.now.min).minutes # Nächste volle Stunde
    time_slots = {} # Jede Stunde zwischen 9 Uhr und jetzt
    while start_time < end_time do
      time_slots[start_time] = self.kard_checkins.where(created_at: [start_time..(start_time + 1.hour)]).count
      start_time = start_time + 1.hour
    end
    result = []
    time_slots.each{ |k,v| result << [k.hour, v] }
    result
  end

  protected

  def generate_key
    hash =  [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
    while self.key.nil?
      key  =  (0...40).map{ hash[rand(hash.length)] }.join
      if Resource.where(key: key).count == 0
        self.key = key
      end
    end
  end
end
