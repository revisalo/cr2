class Pensum < ActiveRecord::Base
  attr_accessible :ano, :semestre
  has_many :materium
  belongs_to :maestrium

  #Validar todos los campos requeridos
  validates :ano, :semestre, :presence => {true,
  	:message => "Todos los campos son requeridos"}
  
  #Validar asociaciones -> No validar del otro lado (eg de materium a carpetum)
  validates_associated :materium
  
  #Validar tamaño y tipos
  validates :ano, :length => { :is => 4 }
  validates :ano, :numericality => { :only_integer => true }
  validates :ano, :numericality => { :greater_than => 1970 }
  validates :semestre, :length => { :is => 1 }
  validates :semestre, :numericality => { :only_integer => true }
  validates :semestre, :numericality => { :greater_than_or_equal_to => 0 }
  validates :semestre, :numericality => { :less_than_or_equal_to => 2 }

end
