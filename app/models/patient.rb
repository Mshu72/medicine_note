class Patient < ApplicationRecord
  belongs_to :user
  has_many :medications
  has_many :prescriptions
  has_many :doctors
  has_many :pharmacies

  # has_many :appointments

  validates :patient_name, presence: true
  validates :birthdate, presence: true
  validates :user_id, presence: true
end
