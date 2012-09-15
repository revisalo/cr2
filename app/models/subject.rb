# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  credits    :integer
#  folder_id  :string(255)
#  pensum_id  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ActiveRecord::Base
  attr_accessible :code, :credits, :folder_id, :name, :pensum_id
  
  belongs_to :folder
  belongs_to :pensum

  #Validar todos los campos requeridos
  validates :code, :credits, :folder_id, :name, :pensum_id, :presence => { :message => "Todos los campos son requeridos" }
  
  #Validar tamaño y tipos
  validates :code, :uniqueness => true
  validates :credits, :numericality => { :only_integer => true }

end
