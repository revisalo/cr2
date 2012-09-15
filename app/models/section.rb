# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  number     :integer
#  teacher    :string(255)
#  subject_id :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Section < ActiveRecord::Base
  attr_accessible :number, :subject_id, :teacher
  belongs_to :subject

  #Validar todos los campos requeridos
  validates :number, :profesor, :presence => { :message => "Todos los campos son requeridos" }
  
  #Validar tamaño y tipos
  validates :number, :numericality => { :only_integer => true }
  validates :number, :numericality => { :greater_than_or_equal_to => 0 }
  validates :subject_id, :uniqueness =>  true

end
