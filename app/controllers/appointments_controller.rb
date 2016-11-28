class AppointmentsController < ApplicationController
  def show
    @appointments = Appointment.find_by :id => params[:id]
  end

  def edit
    @appointment = Appointment.find_by :id => params[:id]
  end

  def update
    appointment = Appointment.find_by :id => params[:id]
    appointment.update appointment_params
    redirect_to appointment
  end

  def destroy
    appointment = Appointment.find_by :id => params[:id]
    appointment.destroy
    redirect_to appointments_path()
  end

  def new
    @appointment = Appointment.new
  end

  def create
    appointment = Appointment.create appointment_params
    redirect_to appointment
  end

  def index
    @appointments = Appointment.all
  end

  private
    def appointment_params
      params.require(:appointment).permit(:start_time, :professional_id, :appointment_type_id, :customer_id)
    end
    #  start_time          :datetime
    #  professional_id     :integer
    #  appointment_type_id :integer
    #  customer_id         :integer
end
