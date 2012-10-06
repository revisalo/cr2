class Section < ActiveRecord::Base
  attr_accessible :day, :hour, :pensum_id, :subject_id
  #Validar atributos
  validates :hour, :numericality => { :only_integer => true }
  validates :hour, :numericality => { :greater_than_or_equal_to => 1 }
  validates :hour, :numericality => { :less_than_or_equal_to => 8 }

  validates :day, :numericality => { :only_integer => true }
  validates :day, :numericality => { :greater_than_or_equal_to => 1 }
  validates :day, :numericality => { :less_than_or_equal_to => 6 }
  validates :pensum_id, :numericality => { :less_than_or_equal_to => 6 }

  validates :hour, :uniqueness => { :scope => :day,
    :message => "" }
    belongs_to :pensum
end
