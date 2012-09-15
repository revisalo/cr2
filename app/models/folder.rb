class Folder < ActiveRecord::Base
  attr_accessible :code, :docid, :name, :semester, :year
 # has_many :subjects
  has_and_belongs_to_many :pensums

#Validar todos los campos requeridos
  validates :year, :code, :docid, :name, :semester, :presence => { :message => "Todos los campos son requeridos" }
  
  #Validar asociaciones -> No validar del otro lado (eg de materium a carpetum)
  #validates_associated :subjects
  validates_associated :pensum
  
  #Validar tamaño y tipos
  validates :year, :length => { :is => 4 }
  validates :year, :numericality => { :only_integer => true }
  validates :year, :numericality => { :greater_than => 1970 }
  validates :code, :length => { :is => 9 }
  validates :code, :numericality => { :only_integer => true }
  validates :code, :uniqueness => true
  validates :docid, :numericality => { :only_integer => true }
  validates :docid, :uniqueness => true
  validates :name, :format => { :with => /\A[a-zA-Z]+\z/ }
  validates :semester, :length => { :is => 1 }
  validates :semester, :numericality => { :only_integer => true }
  validates :semester, :numericality => { :greater_than_or_equal_to => 0 }
  validates :semester, :numericality => { :less_than_or_equal_to => 2 }

end