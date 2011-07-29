require 'spec_helper'

describe "playlists/edit.html.slim" do
  before(:each) do
    @playlist = assign(:playlist, stub_model(Playlist,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit playlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => playlists_path(@playlist), :method => "post" do
      assert_select "input#playlist_name", :name => "playlist[name]"
      assert_select "textarea#playlist_description", :name => "playlist[description]"
    end
  end
end
