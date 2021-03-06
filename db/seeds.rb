# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.roles.each do |role|
  Role.create(name: role)
end

admin = User.create(email: "sandro.raess@philosophie.ch", password: "epikur", password_confirmation: "epikur")

admin.roles << Role.find_by_name("admin")

klima_lernkurs = Course.create(name: "Klimagerechtigkeit", description: "Wer verursacht die meisten Emissionen?")
