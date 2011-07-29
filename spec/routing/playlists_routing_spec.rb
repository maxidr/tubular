require "spec_helper"

describe PlaylistsController do
  describe "routing" do

    it "routes to #index" do
      get("/playlists").should route_to("playlists#index")
    end

    it "routes to #new" do
      get("/playlists/new").should route_to("playlists#new")
    end

    it "routes to #show" do
      get("/playlists/1").should route_to("playlists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/playlists/1/edit").should route_to("playlists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/playlists").should route_to("playlists#create")
    end

    it "routes to #update" do
      put("/playlists/1").should route_to("playlists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/playlists/1").should route_to("playlists#destroy", :id => "1")
    end

  end
end
