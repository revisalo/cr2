# == Schema Information
#
# Table name: folders
#
#  id         :integer          not null, primary key
#  year       :integer
#  code       :string(255)
#  docid      :integer
#  name       :string(255)
#  semester   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FolderTest < ActiveSupport::TestCase
   #test "the truth" do
    # assert true
   #end
end
