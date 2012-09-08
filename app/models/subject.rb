class Subject < ActiveRecord::Base
  attr_accessible :code, :credits, :folder_id, :name, :pensum_id
end
