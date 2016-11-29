class AppointmentsController < ApplicationController
  def show
    @appointments = @current_user.appointments
  end

  def edit
    if !@current_user
      flash[:error] = "You must sign in to continue"
      redirect_to login_path
    else
      @appointment = Appointment.find_by :id => params[:id]
      if @appointment.available || @appointment.customer == @current_user
        @appointment_types = @appointment.professional.appointment_types
      else
        flash[:error] = "Appointment already taken"
        redirect_to user_path(@appointment.professional)
      end
    end
  end

  def update
    appointment = Appointment.find_by :id => params[:id]
    appointment.customer_id = @current_user.id
    appointment.available = false
    appointment.update appointment_params
    redirect_to appointment
  end

  def destroy
    appointment = Appointment.find_by :id => params[:id]
    appointment.destroy
    redirect_to appointments_path
  end

  def new
    @appointment = Appointment.new
    professional = User.find(@current_user.id)
    @appointment_types = professional.appointment_types
  end

  def create
    appointment = Appointment.new appointment_params
    appointment.professional_id = @current_user.id
    appointment.save
    redirect_to appointment
  end

  def index
    @appointments = Appointment.all
  end

  private
    def appointment_params
      params.require(:appointment).permit(:start_time, :appointment_type_id)
    end
    #  start_time          :datetime
    #  professional_id     :integer
    #  appointment_type_id :integer
    #  customer_id         :integer
end
