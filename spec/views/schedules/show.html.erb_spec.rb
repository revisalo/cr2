require 'spec_helper'

describe "schedules/show" do
  before(:each) do
    @schedule = assign(:schedule, stub_model(Schedule,
      :pensum_id => "Pensum",
      :section_id => "Section"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pensum/)
    rendered.should match(/Section/)
  end
end
