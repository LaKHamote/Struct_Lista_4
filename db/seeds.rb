# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Teacher.create!(name: 'Wang', email: 'wang@gmail.com', birth_date: '1966-06-15')
Teacher.create!(name: 'Alexei, o Email', email: 'gasparzinho@gmail.com', birth_date: '1900-08-27')

Language.create!(name:'Python', teacher_id: 1)
Language.create!(name:'Ruby', teacher_id: 2)

Student.create!(name: 'Lucas', registration: rand(10**8...10**9), email: 'lucas@gmail.com', birth_date: '2003-02-15', teacher_id: 1)
Student.create!(name: 'JH', registration: rand(10**8...10**9), email: 'jh@gmail.com', birth_date: '2003-04-07', teacher_id: 1)
Student.create!(name: 'Luigi', registration: rand(10**8...10**9), email: 'luigi@gmail.com', birth_date: '2002-07-11', teacher_id: 1)

Student.create!(name: 'Alex', registration: rand(10**8...10**9), email: 'alex@gmail.com', birth_date: '2002-10-03', teacher_id: 2)
Student.create!(name: 'Vinicius', registration: rand(10**8...10**9), email: 'vini@gmail.com', birth_date: '2002-10-03', teacher_id: 2)
