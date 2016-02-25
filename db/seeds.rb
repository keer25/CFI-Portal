# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Club.create!(name: "The Webops Club")

User.create!(name: "Keerthana",
							email: "admin@cfiportal.com",
							password: "adminpass",
							password_confirmation: "adminpass",
							club_id: 1,
							admin: true)

								