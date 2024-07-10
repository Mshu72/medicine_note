class Medication < ApplicationRecord

  belongs_to :patient
  has_one :image

  

end
