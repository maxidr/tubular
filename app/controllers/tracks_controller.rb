# encoding: utf-8
class TracksController < ApplicationController
  respond_to :html
  
  
  # GET contents/:content_id/tracks/new
  def new
    @content = Content.find(params[:content_id])
    @track = Track.new(:resulting_content => @content, :content => Content.new)
    respond_with @track
  end
  
  def create
    @content = Content.find(params[:content_id])
    @track = Track.new(params[:track])
    @track.resulting_content = @content
    # Parche para evitar que el último agregado aparezca primero en la lista
    @track.position = 99    
    flash[:notice] = 'Se adjuntó el video al contenido.' if @track.save
    respond_with(@track, :location => new_content_track_path(@content))
  end
  
end
