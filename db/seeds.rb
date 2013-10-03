# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Landmark.delete_all
CSV.foreach("#{Rails.root}/db/landmarks.csv") do |row|
   Landmark.create!(:longitude => row[0], :latitude => row[1], :name => row[2], :description => row[3])
end