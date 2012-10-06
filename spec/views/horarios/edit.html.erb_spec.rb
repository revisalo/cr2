require 'spec_helper'

describe "horarios/edit" do
  before(:each) do
    @horario = assign(:horario, stub_model(Horario,
      :materia => "MyString",
      :dia => 1,
      :hora => 1
    ))
  end

  it "renders the edit horario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => horarios_path(@horario), :method => "post" do
      assert_select "input#horario_materia", :name => "horario[materia]"
      assert_select "input#horario_dia", :name => "horario[dia]"
      assert_select "input#horario_hora", :name => "horario[hora]"
    end
  end
end
