# == Schema Information
#
# Table name: pensums
#
#  id          :integer          not null, primary key
#  year        :integer
#  semester    :integer
#  magister_id :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pensum < ActiveRecord::Base
  attr_accessible :magister_id, :semester, :year
  has_many :subjects
  belongs_to :magister

  #Validar todos los campos requeridos
  validates :year, :semester, :presence => {:message => "Todos los campos son requeridos" }
  
  #Validar asociaciones -> No validar del otro lado (eg de materium a carpetum)
  validates_associated :subjects
  
  #Validar tamaño y tipos
  validates :year, :length => { :is => 4 }
  validates :year, :numericality => { :only_integer => true }
  validates :year, :numericality => { :greater_than => 1970 }
  validates :semester, :length => { :is => 1 }
  validates :semester, :numericality => { :only_integer => true }
  validates :semester, :numericality => { :greater_than_or_equal_to => 0 }
  validates :semester, :numericality => { :less_than_or_equal_to => 2 }
  validates :magister_id, :uniqueness => true

end
