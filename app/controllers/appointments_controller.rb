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
    redirect_to appointments_path
  end

  def destroy
    @appointment = Appointment.find_by :id => params[:id]
    if @appointment.customer == @current_user
      if (@appointment.start_time - Time.now) > 24.hours
        reset_appointment
        redirect_to appointments_path
      else
        flash[:error] = "Cannot cancel appointment with less then 24hrs, please contact #{@appointment.professional.email}"
        redirect_to appointments_path
      end
    elsif @appointment.professional == @current_user
      if !@appointment.customer
        @appointment.destroy
        redirect_to appointments_path
      else
        flash[:error] = "Cannot cancel booked appointment, please contact #{@appointment.customer.email}"
        redirect_to @appointment
      end
    end
  end

  def reset_appointment
    @appointment.customer = nil
    @appointment.available = true
    @appointment.appointment_type_id = nil
    @appointment.save
  end

  def new
    @appointment = Appointment.new
    professional = User.find(@current_user.id)
    if professional.meetings.last
      last_appointment = professional.meetings.last.start_time
    else
      last_appointment = Time.now + 24.hours
    end
    @appointment.start_time = last_appointment + 15.minutes
    @appointment_types = professional.appointment_types
  end

  def create
    appointment = Appointment.new appointment_params
    appointment.professional_id = @current_user.id
    appointment.save
    redirect_to appointments_path
  end

  def index
    if @current_user
      @appointments = Appointment.where( "professional_id = #{@current_user.id} OR customer_id = #{@current_user.id}" )
    end
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
