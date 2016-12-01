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
#  description     :text
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :appointments, :foreign_key => "customer_id"

  has_many :meetings, :class_name => "Appointment", :foreign_key => "professional_id"
  # has_many :customers, :class_name => "User", :through => :appointments
  has_many :appointment_types

  has_many :relation_customers, :foreign_key => "professional_id", :class_name => "WorkRelation"
  has_many :relation_professionals, :foreign_key => "customer_id", :class_name => "WorkRelation"

  has_many :customers, :through => :relation_customers
  has_many :professionals, :through => :relation_professionals

  # u = User.first
  # u.unapproved_customers

  def unapproved_customers
    self.relation_customers.where(:approved => false)
  end

  def approved_customers
    self.relation_customers.where(:approved => true)
  end

  def approved_professionals
    self.relation_professionals.where(:approved => true)
  end

  def pending_response
    self.relation_professionals.where(:approved => false)
  end

  # u = User.first
  # u.is_approved_customer?( 136)

  def is_approved_customer?( id )
    current_user = self
    customer = WorkRelation.find_by(
      :professional_id => id,
      :customer_id => current_user.id,
      :approved => true
    )
    if customer
      return true
    end
    false
  end

  def is_pending_customer?( id )
    current_user = self
    customer = WorkRelation.find_by(
      :professional_id => id,
      :customer_id => current_user.id,
      :approved => false
    )
    if customer
      return true
    end
    false
  end

end
