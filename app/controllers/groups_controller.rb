# encoding: utf-8
class GroupsController < ApplicationController

  respond_to :html, :xml, :js, :json

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

  protected

  def find_group
    @group = Group.find(params[:id])
  end
end

