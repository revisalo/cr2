require 'spec_helper'

describe "sections/new" do
  before(:each) do
    assign(:section, stub_model(Section,
      :day => 1,
      :hour => 1,
      :pensum_id => "MyString",
      :subject_id => "MyString"
    ).as_new_record)
  end

  it "renders new section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path, :method => "post" do
      assert_select "input#section_day", :name => "section[day]"
      assert_select "input#section_hour", :name => "section[hour]"
      assert_select "input#section_pensum_id", :name => "section[pensum_id]"
      assert_select "input#section_subject_id", :name => "section[subject_id]"
    end
  end
end
