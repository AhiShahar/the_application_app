class UsersController < ApplicationController

  before_action :authorise, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def show
    # We'll use this to display the index of the user (professional's) appointments index
    if @current_user
      @user = User.find_by :id => params[:id]
      @calendar = @user.meetings.where( :available => true).pluck(:start_time).map { |a| a.strftime "%d-%m-%Y" }.uniq
    else
      flash[:error] = "You must sign in to continue"
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file],
                            :public_id => "#{(@current_user.image.to_i+1).to_s}",
                            :crop => :limit, :width => 200, :height => 400,
                            :eager => [
                              { :width => 200, :height => 200,
                                :crop => :thumb, :gravity => :face,
                                :radius => 20, :effect => :sepia },
                              { :width => 100, :height => 150,
                                :crop => :fit, :format => 'png' }
                            ],
                            :tags => ['special', 'for_homepage'])
      @user.image = req['public_id']
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path( @user )
    else
      render :new
    end
  end

  def edit
    # @user = User.find_by :id => params[:id]
    @user = @current_user
  end

  def update
    # @user = User.find_by :id => params[:id]
    @user = @current_user
    if params[:file].present?
      if @user.image
        @user.image = ""
        @user.save
      end
      req = Cloudinary::Uploader.upload(params[:file],
                            :public_id => "#{(@current_user.image.to_i+1).to_s}",
                            :crop => :limit, :width => 200, :height => 400,
                            :eager => [
                              { :width => 200, :height => 200,
                                :crop => :thumb, :gravity => :face,
                                :radius => 20, :effect => :sepia },
                              { :width => 100, :height => 150,
                                :crop => :fit, :format => 'png' }
                            ],
                            :tags => ['special', 'for_homepage'])
      @user.image = req['public_id']
    end
    @user.assign_attributes user_params
    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def new_relation
    @professional = User.find_by :id => params[:id]
    relations = WorkRelation.create :professional_id => @professional.id, :customer_id => @current_user.id
    relations.save
    redirect_to @professional
  end

  def unapproved
    @users = @current_user.unapproved_customers
    render :index
  end

  def approve_relation
    @customer = User.find_by :id => params[:id]
    relations = WorkRelation.find_by :professional_id => @current_user.id, :customer_id => @customer.id
    relations.approved = true
    relations.save
    redirect_to @current_user
  end

  def destroy
    # user = User.find_by :id => params[:id]
    user = @current_user
    user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation, :is_professional, :profession, :description, :file)
    end

    def authorise
      unless @current_user.present?
        flash[:error] = "You need to be logged in"
        redirect_to login_path
      end
    end

end
