class Resource < ActiveRecord::Base
  has_many :achievement_resources, dependent: :destroy
  has_many :achievements, through: :achievement_resources

  has_many :kard_checkins, dependent: :destroy
  has_many :yet_another_kards, through: :kard_checkins

  attr_accessible :key, :name

  before_validation :generate_key

  validates :key, presence: true, uniqueness: true
  validates :name, presence: true

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
