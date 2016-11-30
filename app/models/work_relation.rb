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

class WorkRelation < ActiveRecord::Base
  belongs_to :professional, :class_name => "User", :foreign_key => "professional_id"
  belongs_to :customer, :class_name => "User", :foreign_key => "customer_id"
end
