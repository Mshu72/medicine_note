class MedicationPrescriptionForm
  include ActiveModel::Model

  attr_accessor :patient_id, :medicine_name, :description, :dosage, :side_effect, 
                :frequency, :duration,
                :doctor_name, :clinic_name, :phone_number,
                :pharmacist, :pharmacy_name, :phone_number

  validates :medicine_name, :dosage, :frequency, :duration, presence: true

  def save
    return false unless valid?

    patient = Patient.find_by(id: patient_id)
    
    ActiveRecord::Base.transaction do
      medication = Medication.create!(
        medicine_name: medicine_name,
        description: description,
        dosage: dosage,
        side_effect: side_effect,
        patient_id: patient.id
      )
      
      Prescription.create!(
        frequency: frequency,
        duration: duration,
        medication_id: medication.id,
        patient_id: patient.id
      )

      Doctor.create!(
        doctor_name: doctor_name,
        clinic_name: clinic_name,
        phone_number: phone_number,
        patient_id: patient.id
      )

      Pharmacy.create!(
        pharmacist: pharmacist,
        pharmacy_name: pharmacy_name,
        phone_number: phone_number,
        patient_id: patient.id
      )
    end

    true
  rescue ActiveRecord::RecordInvalid
    false
  end
    
  def self.find_by_patient(patient_id)
    medications = Medication.where(patient_id: patient_id)
    prescriptions = Prescription.where(medication_id: medications.pluck(:id))
    doctors = Doctor.where(patient_id: patient_id)
    pharmacies = Pharmacy.where(patient_id: patient_id)

    { medications: medications, prescriptions: prescriptions, doctors: doctors, pharmacies: pharmacies }
  end
end