class MedicationsController < ApplicationController
  before_action :set_patient

  def new
    @medication_prescription_form = MedicationPrescriptionForm.new
  end

  def create
    @medication_prescription_form = MedicationPrescriptionForm.new(medication_prescription_params)
    
    if @medication_prescription_form.save
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def patient
    @patient
  end

  def medication_prescription_params
    params.require(:medication_prescription_form).permit(
      :medicine_name, :description, :dosage, :side_effect, 
      :frequency, :duration,
      :doctor_name, :clinic_name, :phone_number,
      :pharmacist, :pharmacy_name, :phone_number
    ).merge(patient_id: patient.id)
  end
end

