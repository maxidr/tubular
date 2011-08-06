# encoding: utf-8
class PlayersController < ApplicationController

  respond_to :html

	before_filter :find_player, :except => [:index, :new, :create]

  # GET /players
  # GET /players.xml
  def index
    @players = Player.all
	  respond_with(@players)
  end

  # GET /players/1
  # GET /players/1.xml
  def show
    respond_with @player
  end

  # GET /players/new
  # GET /players/new.xml
  def new
    @player = Player.new
    @player.branch = Branch.find(params[:branch_id]) if params[:branch_id]
    respond_with @player
  end

  # GET /players/1/edit
  def edit
    respond_with @player
  end

  # POST /players
  # POST /players.xml
  def create
    @player = Player.new(params[:player])
    flash[:notice] = 'Se guardó el nuevo Player.' if @player.save
    respond_with(@player)
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    flash[:notice] = 'Se actualizó el Player.' if @player.update_attributes(params[:player])
    respond_with(@player)
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    flash[:notice] = 'Se eliminó el Player.' if @player.destroy
    respond_with(@player)
  end

  protected

  def find_player
    @player = Player.find(params[:id])
  end
end

