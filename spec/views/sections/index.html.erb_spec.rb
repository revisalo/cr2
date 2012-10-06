require 'spec_helper'

describe "sections/index" do
  before(:each) do
    assign(:sections, [
      stub_model(Section,
        :subject => "Subject",
        :day => 1,
        :hour => 2
      ),
      stub_model(Section,
        :subject => "Subject",
        :day => 1,
        :hour => 2
      )
    ])
  end

  it "renders a list of sections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
