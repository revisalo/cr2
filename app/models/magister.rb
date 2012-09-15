# == Schema Information
#
# Table name: magisters
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Magister < ActiveRecord::Base
  attr_accessible :code
  has_many :pensum

    #Validar todos los campos requeridos
  validates :code, :presence => { :message => "Todos los campos son requeridos" }
  
  #Validar asociaciones -> No validar del otro lado (eg de pensum a maestrium)
  validates_associated :pensum
  
  #Validar tamaño y tipos
  validates :code, :uniqueness => true

end
