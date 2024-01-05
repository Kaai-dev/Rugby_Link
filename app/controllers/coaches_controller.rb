class CoachesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_coach, only: %i[ show edit update destroy ]

  # GET /coaches or /coaches.json
  def index
    @coaches = Coach.all
  end

  # GET /coaches/1 or /coaches/1.json
  def show
  end

  # GET /coaches/new
  def new
    @coach = Coach.new
  end

  # GET /coaches/1/edit
  def edit
    
  end

  # POST /coaches or /coaches.json
  def create
    @coach = Coach.new(coach_params)

    respond_to do |format|
      if @coach.save
        flash[:success] = "Coach was successfully created."
        format.html { redirect_to coach_url(@coach) }
        format.json { render :show, status: :created, location: @coach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coaches/1 or /coaches/1.json
  def update
    respond_to do |format|
      if @coach.update(coach_params)
        flash[:success] = "Coach was successfully updated."
        format.html { redirect_to coach_url(@coach) }
        format.json { render :show, status: :ok, location: @coach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy
    flash[:success] = 'Coach was successfully deleted.'
    redirect_to coaches_path
  end

  def delete_coach_profile_pic
    @coach = Coach.find(params[:id])
    @coach.coach_profile_pic.purge

    flash[:info] = 'Coach profile picture was successfully deleted.'

    redirect_to coach_path(@coach)
  end

  def flash_back_to_index
    flash[:warning] = "Registration canceled."
    redirect_to coaches_path
  end

  def flash_cancel_edit
    @coach = Coach.find(params[:id])
    flash[:warning] = "Editing canceled."
    redirect_to coach_path(@coach)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach = Coach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
      def coach_params
        params.require(:coach).permit(
          :nickname, 
          :fullname, 
          :cellphone_number, 
          :medical_conditions, 
          :has_id, 
          :portrait_photo, 
          :medical_aid,
          :id_number,
          :coach_profile_pic,
        )
      end
end