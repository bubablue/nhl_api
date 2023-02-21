class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index
    @players = Player.all.where(user_id: params[:user_id])
    render json: @players
  end

  # GET /players/1 or /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create

    if(Player.all.where(user_id: player_params[:user_id]).count < 20 && Player.all.where(player_id: player_params[:player_id]).count === 0)
      @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { render :new, status: :created }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  # def destroy
  #   player = Player.find(params[:player_id])
  #   player.destroy
  #   respond_to do |format|
  #     format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  def delete
    player = Player.all
    playerToDestroy = player.where(player_id: params[:player_id])
    playerToDestroy.destroy_all
    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:user, :user_id, :player_id)
    end
end
