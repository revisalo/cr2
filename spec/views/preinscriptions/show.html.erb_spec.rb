require 'spec_helper'

describe "preinscriptions/show" do
  before(:each) do
    @preinscription = assign(:preinscription, stub_model(Preinscription,
      :subjectname => "Subjectname",
      :enrolled => 1,
      :pensum_id => "Pensum"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subjectname/)
    rendered.should match(/1/)
    rendered.should match(/Pensum/)
  end
end
