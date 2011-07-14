# encoding: utf-8
class TracksController < ApplicationController
  respond_to :html
  
  
  # GET contents/:content_id/tracks/new
  def new
    @content = Content.find(params[:content_id])
    @track = Track.new(:content => @content)
    respond_with @track
  end
  
  def create
    # TODO: Implementar
  end
  
end
