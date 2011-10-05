# encoding: utf-8
class PlaylistsController < ApplicationController

  respond_to :html, :xml, :js, :json

	before_filter :find_playlist, :except => [:index, :new, :create]
	
  # GET /playlists
  # GET /playlists.xml
  def index
		@playlists = Playlist.page params[:page]
    respond_with(@playlists)
  end

  # GET /playlists/1
  # GET /playlists/1.xml
  def show
    respond_with @playlist
  end

  # GET /playlists/new
  # GET /playlists/new.xml
  def new
    @playlist = Playlist.new
    respond_with @playlist
  end

  # GET /playlists/1/edit
  def edit
    respond_with @playlist
  end

  # POST /playlists
  # POST /playlists.xml
  def create
    @playlist = Playlist.new(params[:playlist])
    flash[:notice] = 'Se guardó el nuevo Playlist.' if @playlist.save
    redirect_to new_playlist_track_path(@playlist)
  end

  # PUT /playlists/1
  # PUT /playlists/1.xml
  def update
    flash[:notice] = 'Se actualizó el Playlist.' if @playlist.update_attributes(params[:playlist])
    respond_with(@playlist)
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.xml
  def destroy
    flash[:notice] = 'Se eliminó el Playlist.' if @playlist.destroy
    respond_with(@playlist)
  end

  protected

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end
end

