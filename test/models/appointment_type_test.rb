# == Schema Information
#
# Table name: appointment_types
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :float
#  duration    :date
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AppointmentTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
