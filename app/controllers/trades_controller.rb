class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_team_admin!, except: [:index]

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.where(accepted: true)
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    @tradeplayer = TradePlayer.new
    @trade = Trade.find(params[:id])
  end

  # GET /trades/new
  def new
    @trade = Trade.new
    @team = Team.new
  end

  # GET /trades/1/edit
  def edit
    @proposing_team = @trade.proposing_team
    @accepting_team = @trade.accepting_team
  end

  # POST /trades
  # POST /trades.json
  def create
    puts "#{params}"
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { render :new }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

      # @trade.trade_players.build(player: players.first, current_team: @trade.proposing_team)
      # @trade.trade_players.build(player: players.first, current_team: @trade.accepting_team)

  def accept
    @trade = Trade.find(params[:trade_id])
    proposing_team = @trade.proposing_team
    accepting_team = @trade.accepting_team

    proposed = team_players(@trade.trade_players, proposing_team).map{|trade| trade.player }
    acceptor = team_players(@trade.trade_players, accepting_team).map{|trade| trade.player }

    proposed = proposed.each{|player| Player.find(player.team_id).update(team_id: accepting_team.id)}
    acceptor = acceptor.each{|player| Player.find(player.team_id).update(team_id: proposing_team.id)}

    # proposedtraded = (proposing_team.players - proposed) + acceptor
    # acceptedtraded = (accepting_team.players - acceptor) + proposed

    # Team.find(proposing_team.id).players = proposedtraded
    # Team.find(accepting_team.id).players = acceptedtraded

    redirect_to '/'
  end
  # PATCH/PUT /trades/1

  def update
    respond_to do |format|
      update_trade_proposing_team(proposing_team_params,@trade)
      update_trade_accepting_team(accepting_team_params,@trade)
      if @trade.save
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'Trade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    def team_players(trade_players, team)
      trade_players.select do |trade_player|
        if trade_player.player.team == team
          trade_player.player
        end
      end
    end

    def update_team_players(players, new_team)
      players.each do |player|
        player.player.update(team_id: new_team.id)
      end
    end

    def update_trade_proposing_team (params, trade)
      params.each do |param|
        trade.proposing_team_players.build(player: Player.find(param.to_i) )
      end
    end

    def update_trade_accepting_team (params, trade)
      params.each do |param|
        trade.accepting_team_players.build(player: Player.find(param.to_i) )
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:proposing_team_id, :accepting_team_id, :accepted)
    end

    def proposing_team_params
      proposing_team = params.require(:proposing_team)
      proposing_team_players = proposing_team[:player_id].delete_if{|x| x == ""}
    end

    def accepting_team_params
      accepting_team = params.require(:accepting_team)
      accepting_team_players = accepting_team[:player_id].delete_if{|x| x == ""}
    end

end
