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

class AppointmentType < ActiveRecord::Base
  enum category: [ :personal_trainer, :beauty_therapist, :massuesse]
  has_many :appointments
  belongs_to :user
end
