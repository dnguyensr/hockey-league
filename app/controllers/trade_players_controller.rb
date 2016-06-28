class TradePlayersController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  # GET /trades
  # GET /trades.json
  def index
    @tradeplayers = TradePlayer.all
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @tradeplayer = TradePlayer.new
    @team = Team.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @tradeplayer = TradePlayer.new(trade_params)

    respond_to do |format|
      if @tradeplayer.save
        format.html { redirect_to @tradeplayer, notice: 'tradeplayer was successfully created.' }
        format.json { render :show, status: :created, location: @tradeplayer }
      else
        format.html { render :new }
        format.json { render json: @tradeplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @tradeplayer.update(trade_params)
        format.html { redirect_to @tradeplayer, notice: 'tradeplayer was successfully updated.' }
        format.json { render :show, status: :ok, location: @tradeplayer }
      else
        format.html { render :edit }
        format.json { render json: @tradeplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @tradeplayer.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'tradeplayer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @tradeplayer = tradeplayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:tradeplayer).permit(:proposing_team_id, :accepting_team_id, :accepted)
    end
end
