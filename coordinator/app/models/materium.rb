class Materium < ActiveRecord::Base
  attr_accessible :codigo, :nombre
  belongs_to :pensum

  #Validar todos los campos requeridos
  validates :codigo, :nombre, :presence => {true,
  	:message => "Todos los campos son requeridos"}
  
  #Validar tamaño y tipos
  validates :codigo, :uniqueness => true

end
