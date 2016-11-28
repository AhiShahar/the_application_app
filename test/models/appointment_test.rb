# == Schema Information
#
# Table name: appointments
#
#  id                  :integer          not null, primary key
#  start_time          :datetime
#  professional_id     :integer
#  appointment_type_id :integer
#  customer_id         :integer
#  available           :boolean          default(TRUE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
