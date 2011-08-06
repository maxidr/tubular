require 'spec_helper'

describe "players/index.html.slim" do
  before(:each) do
    assign(:players, [
      stub_model(Player,
        :name => "Name",
        :branch => nil
      ),
      stub_model(Player,
        :name => "Name",
        :branch => nil
      )
    ])
  end

  it "renders a list of players" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
