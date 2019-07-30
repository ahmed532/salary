# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

d = Department.create(name: 'sales')
Staff.create(name: 'staff_1',
             email: 'staff_1@mail.com',
             department: d,
             base_salary: 42.0,
             monthly_bonus: 0.17,
             password: 'password_1',
             role: :user)
             
Staff.create(name: 'admin_1',
             email: 'admin_1@mail.com',
             department: d,
             base_salary: 57.0,
             monthly_bonus: 0.19,
             password: 'password_2',
             role: :admin)             

