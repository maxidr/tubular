# encoding: utf-8
class SchedulesController < ApplicationController

  respond_to :html
  respond_to :js, :only => :show
  respond_to :json, :only => :calendar

	before_filter :find_schedule, :except => [:index, :new, :create]
	
	# GET /schedules/1/calendar
	def calendar
	  respond_with(@schedule)
  end

  # GET /schedules
  # GET /schedules.xml
  def index
		@schedules = Schedule.page params[:page]
    respond_with(@schedules)
  end

  # GET /schedules/1
  # GET /schedules/1.xml
  def show
    respond_with @schedule
  end

  # GET /schedules/new
  # GET /schedules/new.xml
  def new
    @schedule = Schedule.build_default
    respond_with @schedule
  end

  # GET /schedules/1/edit
  def edit
    respond_with @schedule
  end

  # POST /schedules
  # POST /schedules.xml
  def create
#    params[:schedule][:segments_attributes].each { |k, v| v.delete("checked") }
    @schedule = Schedule.new(params[:schedule])
    flash[:notice] = 'Se guardó el nuevo Schedule.' if @schedule.save
    respond_with(@schedule)
  end

  # PUT /schedules/1
  # PUT /schedules/1.xml
  def update
    flash[:notice] = 'Se actualizó el Schedule.' if @schedule.update_attributes(params[:schedule])
    respond_with(@schedule)
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.xml
  def destroy
    flash[:notice] = 'Se eliminó el Schedule.' if @schedule.destroy
    respond_with(@schedule)
  end

  protected

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end
end

