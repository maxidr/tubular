# encoding: utf-8
class <%= controller_class_name %>Controller < ApplicationController

  respond_to :html, :xml, :js, :json

	before_filter :authenticate_usuario!
	load_and_authorize_resource

	before_filter :find_<%= singular_table_name %>, :except => [:index, :new, :create]

  # GET <%= route_url %>
  # GET <%= route_url %>.xml
  def index
		@search = <%= class_name %>.search(params[:search])
		@<%= plural_table_name %> = @search.paginate(:page => params[:page], :per_page => 15)
    respond_with(@<%= plural_table_name %>)
  end

  # GET <%= route_url %>/1
  # GET <%= route_url %>/1.xml
  def show
    respond_with @<%= singular_table_name %>
  end

  # GET <%= route_url %>/new
  # GET <%= route_url %>/new.xml
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_with @<%= singular_table_name %>
  end

  # GET <%= route_url %>/1/edit
  def edit
    respond_with @<%= singular_table_name %>
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.xml
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>
    flash[:notice] = 'Se guardó el nuevo <%= human_name %>.' if @<%= singular_table_name %>.save
    respond_with(@<%= singular_table_name %>)
  end

  # PUT <%= route_url %>/1
  # PUT <%= route_url %>/1.xml
  def update
    flash[:notice] = 'Se actualizó el <%= human_name %>.' if @<%= singular_table_name %>.update_attributes(params[:<%= singular_table_name %>])
    respond_with(@<%= singular_table_name %>)
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.xml
  def destroy
    flash[:notice] = 'Se eliminó el <%= human_name %>.' if @<%= singular_table_name %>.destroy
    respond_with(@<%= singular_table_name %>)
  end

  protected

  def find_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end
end

