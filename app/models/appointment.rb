# == Schema Information
#
# Table name: appointments
#
#  id                  :integer          not null, primary key
#  start_time          :datetime
#  professional_id     :integer
#  appointment_type_id :integer
#  category            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :appointment
end
