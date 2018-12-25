# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

st1 = Student.create(first_name: "Christel", last_name: "Mogollon", age: 29, education: "College", email: "christel@me.com", password: "123456")

inst1 = Instructor.create(first_name: "George", last_name: "Chang", age: 45, education: "PHD", email: "gchang@sample.com", password: "111111", cohort_id: 1)

course1 = Course.create(name: "CPS-2400", class_hours: 5000, cohort_id: 1)

cohort1 = Cohort.create(name: "Fall-08", start_date: 20181, end_date: 20182)
