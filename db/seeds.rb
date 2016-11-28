puts "\nUser:"

User.destroy_all

u1 = User.create :first_name => "Joe", :last_name => "Luff", :email => "joe@gmail.com", :phone => "1800-555-555", :password => "chicken", :password_confirmation => "chicken", :is_professional => true
u2 = User.create :first_name => "Pez", :last_name => "Bradley", :email => "pez@gmail.com", :phone => "1800-555-555", :password => "chicken", :password_confirmation => "chicken", :is_professional => true
u3 = User.create :first_name => "Harpo", :last_name => "Marx", :email => "harpo@marx.com", :phone => "1800-555-555", :password => "chicken", :password_confirmation => "chicken", :is_professional => false
u4 = User.create :first_name => "Groucho", :last_name => "Marx", :email => "groucho@marx.com", :phone => "1800-555-555", :password => "chicken", :password_confirmation => "chicken", :is_professional => false

puts "\tUser count: #{ User.all.count }"

#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  phone           :string
#  password_digest :text
#  is_professional :boolean          default(FALSE)


puts "\nAppointment Type"

AppointmentType.destroy_all

t1 = AppointmentType.create :name => "Standard PT Session", :duration => 45, :user_id => u1.id, :price => 80.0, :description => "One on one session for 45 minutes"
t2 = AppointmentType.create :name => "Standard PT Session", :duration => 90, :user_id => u1.id, :price => 120.0, :description => "One on one session for 90 minutes"
t3 = AppointmentType.create :name => "Spray Tan", :duration => 20, :user_id => u2.id, :price => 20.0, :description => "Full body spray tan"
t4 = AppointmentType.create :name => "Eyelash tintin", :duration => 15, :user_id => u2.id, :price => 10.0, :description => "Eyelash tintin"

#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :float
#  duration    :integer
#  user_id     :integer
puts "\tAppointment Type count: #{ AppointmentType.all.count }"
puts "\nAppointment types for #{u1.first_name}:"
u1.appointment_types.each do |app|
  puts "\t #{app.name}"
end
