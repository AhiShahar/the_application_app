# == Schema Information
#
# Table name: work_relations
#
#  id              :integer          not null, primary key
#  customer_id     :integer
#  professional_id :integer
#  approved        :boolean          default(FALSE)
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class WorkRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
