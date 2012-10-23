class Subject < ActiveRecord::Base
  attr_accessible :code, :credits, :name, :capacity, :pensum_id, :blocks

  has_and_belongs_to_many :folders
  has_one :preinscription

  belongs_to :pensum

  #Validar todos los campos requeridos
  validates_associated :preinscription
  validates :code, :credits, :name, :presence => { :message => "Todos los campos son requeridos" }
  
  #Validar tamaño y tipos
  validates :code, :uniqueness => true
  validates :capacity, :numericality => { :only_integer => true }
  validates :credits, :numericality => { :only_integer => true }

  validates :blocks, :numericality => { :only_integer => true }

end