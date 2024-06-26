class PlayersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_player, only: %i[show edit update destroy]

  # GET /players or /players.json
  def index
    @q = Player.ransack(params[:q])
    @players = @q.result(distinct: true)
  end

  # GET /players/1 or /players/1.json
  def show; end

  # GET /players/new
  def new
    @player = Player.new
    @player.build_next_of_kin
  end

  # GET /players/1/edit
  def edit; end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        flash[:success] = 'Player was successfully created.'
        format.html { redirect_to player_url(@player) }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        flash[:success] = 'Player was successfully updated.'
        format.html { redirect_to player_url(@player) }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.player_profile_pic.purge
    @player.copy_of_id.purge
    @player.destroy

    flash[:success] = 'Player was successfully deleted.'
    redirect_to players_path
  end

  def delete_player_profile_pic
    @player = Player.find(params[:id])
    @player.player_profile_pic.purge

    flash[:info] = 'Player profile picture was successfully removed.'

    redirect_to edit_player_path(@player)
  end

  def flash_back_to_index
    flash[:warning] = 'Registration canceled.'
    redirect_to players_path
  end

  def flash_cancel_edit
    @player = Player.find(params[:id])
    flash[:warning] = 'Editing canceled.'
    redirect_to player_path(@player)
  end

  def remove_copy_of_id
    @player = Player.find(params[:id])
    @player.copy_of_id.purge

    flash[:info] = "Player's ID was successfully removed."

    redirect_to edit_player_path(@player)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(
      :nickname,
      :fullname,
      :cellphone_number,
      :medical_conditions,
      :has_id,
      :portrait_photo,
      :medical_aid,
      :id_number,
      :player_profile_pic,
      :player_position,
      :copy_of_id,
      position_ids: [],
      next_of_kin_attributes: %i[
        id
        player_id
        name
        cellphone_number
        relationship
      ]
    )
  end
end
