# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Cleaning data
puts "Cleaning existing data..."
classes = %w{ User ForHire Event Opening Project Sponsor }
clean_bar = ProgressBar.new(classes.size)
classes.each do |klass|
  clean_bar.increment!
  klass.constantize.send(:delete_all)
end
puts "done\n\n"

# Users
num_users = 100
users_bar = ProgressBar.new(num_users)
puts "Seeding #{num_users} users..."
Factory :admin
Factory :user, :verified => true, :login => "007", :firstname => "James", :lastname => "Bond"
num_users.times do
  users_bar.increment!
  Factory :user, :verified => [true, true, false].sample
end
puts "done\n\n"
users = User.non_admin.verified

# For Sponsors
puts "Seeding for sponsors"
num_sponsors = 10
sponsors_bar = ProgressBar.new(num_sponsors)
num_sponsors.times do
  sponsors_bar.increment!
  Factory :sponsor
end
puts "done\n\n"

# For Hires
puts "Seeding for hires..."
for_hires_bar = ProgressBar.new(users.size)
users.each do |user|
  for_hires_bar.increment!
  if [true, false].sample
    Factory :for_hire, :user => user
  end
end
puts "done\n\n"

# Events
puts "Seeding events..."
events_bar = ProgressBar.new(users.size)
users.each do |user|
  events_bar.increment!
  if [true, false].sample
    if [true, false].sample
      Factory :event, :user => user
    else
      Factory :event, :user => user, :approved => false
    end
  end
end
puts "done\n\n"

# Openings
puts "Seeding openings..."
openings_bar = ProgressBar.new(users.size)
users.each do |user|
  openings_bar.increment!
  if [true, false].sample
    Factory :opening, :user => user
  end
end
puts "done\n\n"

# Projects
puts "Seeding projects..."
projects_bar = ProgressBar.new(users.size)
users.each do |user|
  projects_bar.increment!
  if [true, false].sample
    Factory :project, :user => user
  end
end
puts "done\n\n"
