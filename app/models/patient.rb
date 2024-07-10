class Patient < ApplicationRecord
  belongs_to :user
  has_many :medications
  has_many :prescriptions

  # has_many :appointments
  # has_many :doctors, through: :appointments

  validates :patient_name, presence: true
  validates :birthdate, presence: true
  validates :user_id, presence: true
end
