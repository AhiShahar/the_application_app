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

class Appointment < ActiveRecord::Base
  belongs_to :professional, :class_name => "User", :foreign_key => "professional_id"
  belongs_to :customer, :class_name => "User", :foreign_key => "customer_id"
  belongs_to :appointment_type
  default_scope { order(start_time: :asc) }
  # def sort_appointment
  #   appointments.order(Appointment.arel_table['start_time'].desc)
  # end
end
