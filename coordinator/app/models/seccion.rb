class Seccion < ActiveRecord::Base
  attr_accessible :creditos, :numero, :profesor

  #Validar todos los campos requeridos
  validates :creditos, :numero, :profesor => {true,
  	:message => "Todos los campos son requeridos"}
  
  #Validar tamaño y tipos
  validates :creditos, :numericality => { :only_integer => true }
  validates :numero, :numericality => { :only_integer => true }
  validates :numero, :numericality => { :greater_than_or_equal_to => 0 }

end
