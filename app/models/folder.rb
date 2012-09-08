class Folder < ActiveRecord::Base
  attr_accessible :code, :docid, :name, :semester, :year
end
