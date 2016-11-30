class AppointmentTypesController < ApplicationController

  def show
    @appointment_types = AppointmentType.where :user_id => params[:id]
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
    redirect_to appointment_types_path
  end

  def new
    @appointment_type = AppointmentType.new
  end

  def create
    appointment_type = AppointmentType.new
    appointment_type.update appointment_type_params
    appointment_type.user_id = @current_user.id
    appointment_type.save
    redirect_to appointment_type
  end

  def index
    @appointment_types = AppointmentType.all
  end

  def search
    # params[:search]
    @appointment_types = []
    AppointmentType.all.each do |app|
      if app.description.to_s.include? params[:search]
        @appointment_types << app
      end
    end
    render :index
  end

  private
    def appointment_type_params
      params.require(:appointment_type).permit(:name, :duration, :price, :description)
    end
    #  name        :string
    #  description :text
    #  price       :float
    #  duration    :integer
    #  user_id     :integer
end
