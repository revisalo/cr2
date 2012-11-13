class Schedule < ActiveRecord::Base
  attr_accessible :pensum_id, :section_id
  belongs_to :pensums
  has_many :sections 
end
