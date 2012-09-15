class Magister < ActiveRecord::Base
  attr_accessible :code
  has_many :pensum

    #Validar todos los campos requeridos
  validates :code, :presence => { :message => "Todos los campos son requeridos" }
  
  #Validar asociaciones -> No validar del otro lado (eg de pensum a maestrium)
  validates_associated :pensum
  
  #Validar tamaño y tipos
  validates :code, :uniqueness => true

end