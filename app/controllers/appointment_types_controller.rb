class AppointmentTypesController < ApplicationController

  def show
    @appointment_types = AppointmentType.find_by :id => params[:id]
  end

  def edit
    @appointment_type = AppointmentType.find_by :id => params[:id]
  end

  def update
    appointment_type = AppointmentType.find_by :id => params[:id]
    appointment_type.update appointment_type_params
    redirect_to appointment_type
  end

  def destroy
    appointment_type = AppointmentType.find_by :id => params[:id]
    appointment_type.destroy
    redirect_to appointment_types_path()
  end

  def new
    @appointment_type = AppointmentType.new
  end

  def create
    appointment_type = AppointmentType.create appointment_type_params
    redirect_to appointment_type
  end

  def index
    @appointment_types = AppointmentType.all
  end

  private
    def appointment_type_params
      params.require(:appointment_type).permit(:name, :user_id, :duration, :price, :description)
    end
    #  name        :string
    #  description :text
    #  price       :float
    #  duration    :integer
    #  user_id     :integer
end
