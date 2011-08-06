require 'spec_helper'

describe "players/show.html.slim" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :name => "Name",
      :branch => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
