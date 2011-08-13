# encoding: utf-8
class TracksController < ApplicationController
  respond_to :html, :json
  respond_to :js, :only => [:edit, :update]

  before_filter :load_playlist, :except => [:destroy, :edit, :update]

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

  def edit
    @track = Track.find(params[:id])
#    @track.name = @track.content.name
#    @track.start_at = Duration.new
    @track.end_time = @track.content.duration
    respond_with @track
  end

  def update
    @track = Track.find(params[:id])
    respond_with do |format|
      if @track.update_attributes(params[:track])
        format.js {}
      else
        format.js do
            render :template=>"shared/form_errors.js.erb",
            :locals=> { :item => @track,  :notice => "There were errors creating your bar." }
        end
      end
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

