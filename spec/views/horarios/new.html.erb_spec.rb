require 'spec_helper'

describe "horarios/new" do
  before(:each) do
    assign(:horario, stub_model(Horario,
      :materia => "MyString",
      :dia => 1,
      :hora => 1
    ).as_new_record)
  end

  it "renders new horario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => horarios_path, :method => "post" do
      assert_select "input#horario_materia", :name => "horario[materia]"
      assert_select "input#horario_dia", :name => "horario[dia]"
      assert_select "input#horario_hora", :name => "horario[hora]"
    end
  end
end
