class Section < ActiveRecord::Base
  attr_accessible :number, :subject_id, :teacher
  belongs_to :subject

  #Validar todos los campos requeridos
  validates :number, :profesor => {true,
  	:message => "Todos los campos son requeridos"}
  
  #Validar tamaño y tipos
  validates :number, :numericality => { :only_integer => true }
  validates :number, :numericality => { :greater_than_or_equal_to => 0 }
  validates :subject_id, :uniqueness => {true,
  	:message => "El código de la materia debe ser único"}

end
