class Subject < ActiveRecord::Base
  attr_accessible :code, :credits, :folder_id, :name, :pensum_id
  
  belongs_to :folder
  belongs_to :pensum

  #Validar todos los campos requeridos
  validates :code, :credits, :folder_id, :name, :pensum_id, :presence => {true,
  	:message => "Todos los campos son requeridos"}
  
  #Validar tamaño y tipos
  validates :code, :uniqueness => true
  validates :credits, :numericality => { :only_integer => true }

end
