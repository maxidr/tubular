# encoding: utf-8
class BranchesController < ApplicationController

  respond_to :html

	before_filter :find_branch, :except => [:index, :new, :create]

  # GET /branches
  # GET /branches.xml
  def index
    @branches = Branch.page params[:page]
    respond_with(@branches)
  end

  # GET /branches/1
  # GET /branches/1.xml
  def show
    respond_with @branch
  end

  # GET /branches/new
  # GET /branches/new.xml
  def new
    @branch = Branch.new
    @branch.client = Client.find(params[:client_id]) if params[:client_id]
    respond_with @branch
  end

  # GET /branches/1/edit
  def edit
    respond_with @branch
  end

  # POST /branches
  # POST /branches.xml
  def create
    @branch = Branch.new(params[:branch])
    flash[:notice] = 'Se guardó el nuevo Branch.' if @branch.save
    respond_with(@branch)
  end

  # PUT /branches/1
  # PUT /branches/1.xml
  def update
    flash[:notice] = 'Se actualizó el Branch.' if @branch.update_attributes(params[:branch])
    respond_with(@branch)
  end

  # DELETE /branches/1
  # DELETE /branches/1.xml
  def destroy
    flash[:notice] = 'Se eliminó el Branch.' if @branch.destroy
    respond_with(@branch)
  end

  protected

  def find_branch
    @branch = Branch.find(params[:id])
  end
end

