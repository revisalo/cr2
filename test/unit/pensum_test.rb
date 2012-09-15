# == Schema Information
#
# Table name: pensums
#
#  id          :integer          not null, primary key
#  year        :integer
#  semester    :integer
#  magister_id :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PensumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
