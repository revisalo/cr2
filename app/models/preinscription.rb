class Preinscription < ActiveRecord::Base
  attr_accessible :enrolled, :pensum_id, :subject_id, :date
  belongs_to :subject
  belongs_to :pensum

  #Validar todos los campos requeridos
  validates :enrolled, :pensum_id, :subject_id, :presence => {:message => "Todos los campos son requeridos" }

end
