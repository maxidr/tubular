# encoding: utf-8
class TracksController < ApplicationController
  respond_to :html, :json
  
  before_filter :load_playlist, :except => :destroy
  
  def index    
    @tracks = @playlist.tracks
    render :json => @tracks.collect { |t| t.to_jq_upload }.to_json
  end
  
  # GET playlist/:playlist_id/tracks/new
  def new
    @track = Track.new(:playlist => @playlist, :content => Content.new)
    respond_with @track
  end
  
  def create
    content = Content.new(params[:track])
    @track = Track.new(:content => content, :playlist => @playlist)
    @track.position = 99    
    if @track.save
      render :json => [ @track.to_jq_upload ].to_json    
    else
      render :json => [ @track.to_jq_upload.merge({ :error => "custom_failure" }) ].to_json
    end
  end
  
  # DELETE /tracks/:id
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    render :json => true
  end
  
  # PUT playlists/:playlist_id/tracks/sort
  def sort
    if params[:order]
      order_ids = params[:order].map{ |v| v.to_i }
      Track.transaction do 
        @playlist.tracks.each do |track|
          track.position = order_ids.find_index(track.id)
          track.save
        end
      end      
    end
    render :json => true
  end
  
  private 
  
  def load_playlist
    @playlist = Playlist.find(params[:playlist_id])
  end
  
end
