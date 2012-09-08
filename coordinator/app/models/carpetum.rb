class Carpetum < ActiveRecord::Base
  attr_accessible :anoingreso, :codigo, :docid, :nombre, :semestre
  has_many :materium
  has_one :pensum
  
  #Validar todos los campos requeridos
  validates :anoingreso, :codigo, :docid, :nombre, :semestre, :presence => {true,
  	:message => "Todos los campos son requeridos"}
  
  #Validar asociaciones -> No validar del otro lado (eg de materium a carpetum)
  validates_associated :materium
  validates_associated :pensum
  
  #Validar tamaño y tipos
  validates :anoningreso, :length => { :is => 4 }
  validates :anoingreso, :numericality => { :only_integer => true }
  validates :anoingreso, :numericality => { :greater_than => 1970 }
  validates :codigo, :length => { :is => 9 }
  validates :codigo, :numericality => { :only_integer => true }
  validates :codigo, :uniqueness => true
  validates :docid, :numericality => { :only_integer => true }
  validates :docid, :uniqueness => true
  validates :nombre, :format => { :with => /\A[a-zA-Z]+\z/ }
  validates :semestre, :length => { :is => 1 }
  validates :semestre, :numericality => { :only_integer => true }
  validates :semestre, :numericality => { :greater_than_or_equal_to => 0 }
  validates :semestre, :numericality => { :less_than_or_equal_to => 2 }

end