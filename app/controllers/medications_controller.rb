class MedicationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @medications = Medication.all
  end

  def new 
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)

    if @medication.save
      redirect_to patient_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @medication = Medication.find(params[:id])
  end

  private

  def medication_params
    params.require(:medication).permit(:medication_name, :description, :dosage, :side_effect, :image).merge(patient_id: params[:patient_id])
  end

end
