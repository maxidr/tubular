# encoding: utf-8
class ClientsController < ApplicationController

  respond_to :html

#	before_filter :authenticate_usuario!
#	load_and_authorize_resource

	before_filter :find_client, :except => [:index, :new, :create]

  # GET /clients
  # GET /clients.xml
  def index
#		@search = Client.search(params[:search])
#		@clients = @search.paginate(:page => params[:page], :per_page => 15)
    @clients = Client.page params[:page]
    respond_with(@clients)
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    respond_with @client
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new
    respond_with @client
  end

  # GET /clients/1/edit
  def edit
    respond_with @client
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])
    flash[:notice] = 'Se guardó el nuevo Client.' if @client.save
    respond_with(@client)
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    flash[:notice] = 'Se actualizó el Client.' if @client.update_attributes(params[:client])
    respond_with(@client)
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    flash[:notice] = 'Se eliminó el Client.' if @client.destroy
    respond_with(@client)
  end

  protected

  def find_client
    @client = Client.find(params[:id])
  end
end

