require 'spec_helper'

describe "horarios/show" do
  before(:each) do
    @horario = assign(:horario, stub_model(Horario,
      :materia => "Materia",
      :dia => 1,
      :hora => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Materia/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
