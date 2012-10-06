require 'spec_helper'

describe "schedules/new" do
  before(:each) do
    assign(:schedule, stub_model(Schedule,
      :pensum_id => "MyString",
      :section_id => "MyString"
    ).as_new_record)
  end

  it "renders new schedule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => schedules_path, :method => "post" do
      assert_select "input#schedule_pensum_id", :name => "schedule[pensum_id]"
      assert_select "input#schedule_section_id", :name => "schedule[section_id]"
    end
  end
end
