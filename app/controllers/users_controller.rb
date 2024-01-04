class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    
    respond_to do |format|
      if @user.save
        flash[:success] = "User was successfully created."
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    default_user_setting = UserSetting.create(
      dark_mode: false,
      user_id: @user.id,
    )
    
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "User was successfully updated."
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User was successfully deleted."
    redirect_to users_path
  end

  def delete_user_profile_pic
    @user = User.find(params[:id])
    @user.user_profile_pic.purge
    flash[:success] = 'User profile picture was successfully deleted.'
    redirect_to user_path(@user)
  end

  def flash_back_to_index
    flash[:warning] = "Registration canceled."
    redirect_to users_path
  end

  def flash_cancel_edit
    @user = User.find(params[:id])
    flash[:warning] = "Editing canceled."
    redirect_to user_path(@user)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(
          :id, 
          :email, 
          :password, 
          :password_confirmation,
          :username,
          :role,
          :user_profile_pic,
        )
      end
end
