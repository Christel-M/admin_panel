# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create(first_name: "Christel", last_name: "Mogollon", age: 29, education: "College")

Instructor.create(first_name: "George", last_name: "Chang", age: 45, education: "PHD", cohort_id: 1, salary: 123444)

Course.create(name: "CPS-2400", class_hours: 5000, cohort_id: 1)

# Cohort.create(name: "Fall-08", start_date: 20181, end_date: 20182)
