#Testing Associtations

andre = Student.create(name: "Andre", email: "andre@andre.com", password: "password12")
aisha = Student.create(name: "Aisha", email: "aisha@aisha.com", password: "password23")

course_1 = Course.create(name: "Software Engineering", description: "Learn how to code!", user_id: andre.id)
course_2 = Course.create(name:"Biology", description: "Learn about Biology!", user_id: aisha.id)

