class PatientsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create] 

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to authenticated_root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end
  
  private

  def patient_params
    params.require(:patient).permit(:patient_name, :birthdate, :gender).merge(user_id: current_user.id)
  end

end
