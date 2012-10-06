require 'spec_helper'

describe "sections/edit" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :subject => "MyString",
      :day => 1,
      :hour => 1
    ))
  end

  it "renders the edit section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path(@section), :method => "post" do
      assert_select "input#section_subject", :name => "section[subject]"
      assert_select "input#section_day", :name => "section[day]"
      assert_select "input#section_hour", :name => "section[hour]"
    end
  end
end
