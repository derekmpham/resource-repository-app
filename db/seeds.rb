# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.delete_all
Resource.delete_all

student_users = 20.times.map do
  User.create!(email: Faker::Internet.email,
    password_hash: 'password',
    role: 'student')
end

teacher_users = 10.times.map do
  User.create!(email: Faker::Internet.email,
    password_hash: 'password',
    role: 'teacher')
end

