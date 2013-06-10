class KardCheckin < ActiveRecord::Base
  belongs_to :resource
  belongs_to :yet_another_kard
end
