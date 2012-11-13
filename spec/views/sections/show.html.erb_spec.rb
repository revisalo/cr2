require 'spec_helper'

describe "sections/show" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :day => 1,
      :hour => 2,
      :pensum_id => "Pensum",
      :subject_id => "Subject"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Pensum/)
    rendered.should match(/Subject/)
  end
end
