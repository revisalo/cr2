class Preinscription < ActiveRecord::Base
  attr_accessible :enrolled, :pensum_id, :subjectname
  belongs_to :pensum

  #Validar todos los campos requeridos
  validates :enrolled, :pensum_id, :subjectname, :presence => {:message => "Todos los campos son requeridos" }

end
