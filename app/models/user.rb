# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  phone           :string
#  password_digest :text
#  image           :text
#  is_professional :boolean          default(FALSE)
#  profession      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :appointments, :foreign_key => "customer_id"
  has_many :meetings, :class_name => "Appointment", :foreign_key => "professional_id"
  # has_many :customers, :class_name => "User", :through => :appointments
  has_many :appointment_types

end
