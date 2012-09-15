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

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
