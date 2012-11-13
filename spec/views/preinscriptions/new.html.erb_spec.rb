require 'spec_helper'

describe "preinscriptions/new" do
  before(:each) do
    assign(:preinscription, stub_model(Preinscription,
      :subjectname => "MyString",
      :enrolled => 1,
      :pensum_id => "MyString"
    ).as_new_record)
  end

  it "renders new preinscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => preinscriptions_path, :method => "post" do
      assert_select "input#preinscription_subjectname", :name => "preinscription[subjectname]"
      assert_select "input#preinscription_enrolled", :name => "preinscription[enrolled]"
      assert_select "input#preinscription_pensum_id", :name => "preinscription[pensum_id]"
    end
  end
end
