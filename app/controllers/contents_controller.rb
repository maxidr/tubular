# coding: utf-8
class ContentsController < ApplicationController

  respond_to :html, :xml, :js, :json

#	before_filter :authenticate_usuario!
#	load_and_authorize_resource

	before_filter :find_content, :except => [:index, :new, :create, :mix]

  # GET /contents
  # GET /contents.xml
  def index
#		@search = Content.search(params[:search])
#		@contents = @search.paginate(:page => params[:page], :per_page => 15)
    @contents = Content.all
    respond_with(@contents)
  end

  # GET /contents/1
  # GET /contents/1.xml
  def show
    respond_with @content
  end

  # GET /contents/new
  # GET /contents/new.xml
  def new
    @content = Content.new
    respond_with @content
  end

  # GET /contents/1/edit
  def edit
    respond_with @content
  end
  
  def mix
    @content = Content.new
    respond_with @content
  end

  # POST /contents
  # POST /contents.xml
  def create
    @content = Content.new(params[:content])
    flash[:notice] = 'Se guardó el nuevo Content.' if @content.save
    respond_with(@content)
  end

  # PUT /contents/1
  # PUT /contents/1.xml
  def update
    flash[:notice] = 'Se actualizó el Content.' if @content.update_attributes(params[:content])
    respond_with(@content)
  end

  # DELETE /contents/1
  # DELETE /contents/1.xml
  def destroy
    flash[:notice] = 'Se eliminó el Content.' if @content.destroy
    respond_with(@content)
  end

  protected

  def find_content
    @content = Content.find(params[:id])
  end
end

