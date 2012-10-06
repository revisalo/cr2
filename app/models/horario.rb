class Horario < ActiveRecord::Base
  attr_accessible :dia, :hora, :materia

  validates :dia, :numericality => { :greater_than_or_equal_to => 1 }
  validates :dia, :numericality => { :less_than_or_equal_to => 7 }

  validates :hora, :numericality => { :greater_than_or_equal_to => 1 }
  validates :hora, :numericality => { :less_than_or_equal_to => 8 }

  validates :hora, :uniqueness => { :scope => :dia,
    :message => "No pueden existir dos materias a la misma hora" }



end
