require 'spec_helper'

describe "sections/new" do
  before(:each) do
    assign(:section, stub_model(Section,
      :subject => "MyString",
      :day => 1,
      :hour => 1
    ).as_new_record)
  end

  it "renders new section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path, :method => "post" do
      assert_select "input#section_subject", :name => "section[subject]"
      assert_select "input#section_day", :name => "section[day]"
      assert_select "input#section_hour", :name => "section[hour]"
    end
  end
end
