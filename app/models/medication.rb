class Medication < ApplicationRecord
  belongs_to :patient
  has_many :prescriptions
end
