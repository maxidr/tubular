# encoding: utf-8
class GroupsController < ApplicationController

  respond_to :html
  respond_to :js, :only => [:client_structure]

	before_filter :find_group, :except => [:index, :new, :create]

  # GET /groups
  # GET /groups.xml
  def index
		@groups = Group.all
    respond_with(@groups)
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    respond_with @group
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new
    respond_with @group
  end

  # GET /groups/1/edit
  def edit
    respond_with @group
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])
    branches = params[:branches]
    players = params[:players]

    logger.debug("Branches: #{branches}")
    logger.debug("Players: #{players}")
    associate_groupable_items(branches, Branch.to_s)
    associate_groupable_items(players, Player.to_s)

    flash[:notice] = 'Se guardó el nuevo Group.' if @group.save
    respond_with(@group)
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    flash[:notice] = 'Se actualizó el Group.' if @group.update_attributes(params[:group])
    respond_with(@group)
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    flash[:notice] = 'Se eliminó el Group.' if @group.destroy
    respond_with(@group)
  end

  def client_structure
    logger.debug("Client id: #{params[:id]}")
    @client = Client.find(params[:id])
    respond_with(@client)
  end

  protected

  def find_group
    @group = Group.find(params[:id])
  end

  def associate_groupable_items(branch_ids, type = 'Branch')
    branch_ids.each do |id|
      @group.associations.build(:groupable_id => id, :groupable_type => type)
    end
  end
end

