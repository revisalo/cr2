class Maestrium < ActiveRecord::Base
  attr_accessible :codigo
  has_many :pensum

    #Validar todos los campos requeridos
  validates :codigo, :presence => {true,
  	:message => "Todos los campos son requeridos"}
  
  #Validar asociaciones -> No validar del otro lado (eg de pensum a maestrium)
  validates_associated :pensum
  
  #Validar tamaño y tipos
  validates :codigo, :uniqueness => {true,
  	:message => "El código debe ser único"}

end