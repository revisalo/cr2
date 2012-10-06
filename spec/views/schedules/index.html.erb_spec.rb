require 'spec_helper'

describe "schedules/index" do
  before(:each) do
    assign(:schedules, [
      stub_model(Schedule,
        :pensum_id => "Pensum",
        :section_id => "Section"
      ),
      stub_model(Schedule,
        :pensum_id => "Pensum",
        :section_id => "Section"
      )
    ])
  end

  it "renders a list of schedules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pensum".to_s, :count => 2
    assert_select "tr>td", :text => "Section".to_s, :count => 2
  end
end
