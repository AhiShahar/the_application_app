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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
