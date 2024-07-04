class Medication < ApplicationRecord

  belongs_to :patient
  has_one :image

  validates :medication_name, presence: true
  validates :dosage, presence: true 
  validates :description, presence: true
  validates :side_effect, presence: true

end
