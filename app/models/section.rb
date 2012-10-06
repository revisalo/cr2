class Section < ActiveRecord::Base
  attr_accessible :day, :hour, :pensum_id, :subject_id

  belongs_to :pensum


  #Se valida que todos los campos estén presentes
  validates :day, :hour, :pensum_id, :subject_id, :presence => {:message => "Todos los campos son requeridos" }

  #Validar atributos
  validates :hour, :numericality => { :only_integer => true }
  validates :hour, :numericality => { :greater_than_or_equal_to => 1 }
  validates :hour, :numericality => { :less_than_or_equal_to => 8 }

  validates :day, :numericality => { :only_integer => true }
  validates :day, :numericality => { :greater_than_or_equal_to => 1 }
  validates :day, :numericality => { :less_than_or_equal_to => 6 }
  validates :pensum_id, :numericality => { :less_than_or_equal_to => 6 }
  validates_uniqueness_of :subject_id, :scope => [:day, :hour]
    
end
