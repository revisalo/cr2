class Subject < ActiveRecord::Base
  attr_accessible :code, :credits, :name

  belongs_to :pensum

  #Validar todos los campos requeridos
  validates :code, :credits, :name, :presence => { :message => "Todos los campos son requeridos" }
  
  #Validar tamaño y tipos
  validates :code, :uniqueness => true
  validates :credits, :numericality => { :only_integer => true }

end