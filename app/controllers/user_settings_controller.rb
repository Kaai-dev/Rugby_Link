class UserSettingsController < ApplicationController
  before_action :set_user_setting, only: %i[show edit update destroy]

  # GET /user_settings or /user_settings.json
  def index
    @user_settings = UserSetting.all
  end

  # GET /user_settings/1 or /user_settings/1.json
  def show; end

  # GET /user_settings/new
  def new
    @user_setting = UserSetting.new
  end

  # GET /user_settings/1/edit
  def edit; end

  # POST /user_settings or /user_settings.json
  def create
    @user_setting = UserSetting.new(user_setting_params)

    respond_to do |format|
      if @user_setting.save
        flash[:success] = 'User setting was successfully created.'
        format.html { redirect_to user_setting_url(@user_setting) }
        format.json { render :show, status: :created, location: @user_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_settings/1 or /user_settings/1.json
  def update
    respond_to do |format|
      if @user_setting.update(user_setting_params)
        flash[:success] = 'User setting was successfully updated.'
        format.html { redirect_to user_setting_url(@user_setting) }
        format.json { render :show, status: :ok, location: @user_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_settings/1 or /user_settings/1.json
  def destroy
    @user_setting.destroy!

    respond_to do |format|
      flash[:success] = 'User setting was successfully destroyed.'
      format.html { redirect_to user_settings_url }
      format.json { head :no_content }
    end
  end

  def dark_mode_route
    user_setting = UserSetting.find(params[:id])
    if user_setting.update(dark_mode: params[:dark_mode])
      puts 'Dark-mode switched###'
      # You might want to return a success response here
    else
      render json: { success: false, errors: user_setting.errors.full_messages }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_setting
    @user_setting = UserSetting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_setting_params
    params.require(:user_setting).permit(:user_id, :dark_mode)
  end
end
