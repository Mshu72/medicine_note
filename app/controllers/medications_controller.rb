class MedicationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @medications = Medication.all
  end

  def new 
    @medication_prescription = MedicationPrescription.new
  end

  def create
    @medication_prescription = MedicationPrescription.new(medication_params)

    if @medication_prescription.valid?
      @medication_prescription.save
      redirect_to patient_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @medication_prescription = MedicationPrescription.find(params[:medication_id])
  end

  private

  def medication_params
    params.require(:medication_prescription).permit(:medication_name, :description, :dosage, :side_effect, :image, :prescribed_at, :frequency, :duration).merge(patient_id: params[:patient_id])
  end

end
