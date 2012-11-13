require 'spec_helper'

describe "preinscriptions/index" do
  before(:each) do
    assign(:preinscriptions, [
      stub_model(Preinscription,
        :subjectname => "Subjectname",
        :enrolled => 1,
        :pensum_id => "Pensum"
      ),
      stub_model(Preinscription,
        :subjectname => "Subjectname",
        :enrolled => 1,
        :pensum_id => "Pensum"
      )
    ])
  end

  it "renders a list of preinscriptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subjectname".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Pensum".to_s, :count => 2
  end
end
