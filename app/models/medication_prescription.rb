class MedicationPrescriptionForm
  include ActiveModel::Model

  attr_accessor :medication_name, :image, :description, :dosage, :side_effects,
                :prescribed_at, :frequency, :duration, :patient_id, :user_id

  with_options presence: true do
    validates :medication_name
    validates :prescribed_at 
    validates :frequency
    validates :duration
    validates :patient_id
    validates :dosage
    validates :description
  end



  def save
    return false unless valid?

    medication = Medication.create(
      medication_name: medication_name,
      image: image,
      description: description,
      dosage: dosage,
      side_effects: side_effects,
      patient_id: patient_id
    )

    Prescription.create(
      medication_id: medication.id,
      prescribed_at: prescribed_at,
      frequency: frequency,
      duration: duration,
      patient_id: patient_id
    )
  end
end