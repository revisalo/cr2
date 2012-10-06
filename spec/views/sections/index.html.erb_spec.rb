require 'spec_helper'

describe "sections/index" do
  before(:each) do
    assign(:sections, [
      stub_model(Section,
        :day => 1,
        :hour => 2,
        :pensum_id => "Pensum",
        :subject_id => "Subject"
      ),
      stub_model(Section,
        :day => 1,
        :hour => 2,
        :pensum_id => "Pensum",
        :subject_id => "Subject"
      )
    ])
  end

  it "renders a list of sections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Pensum".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
  end
end
