# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

require 'faker'

10.times do
Student.create([
    { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, grade: Student::GRADES.sample}])
end

