#Testing Associtations
Student.delete_all
Course.delete_all

andre = Student.create(name: "Andre", email: "andre@andre.com", password: "password12")
aisha = Student.create(name: "Aisha", email: "aisha@aisha.com", password: "password23")

course_1 = Course.create(name: "Software Engineering", description: "Learn how to code!")
course_2 = Course.create(name:"Biology", description: "Learn about Biology!")
course_3 = Course.create(name: "English", description: "Learn how to write!")
course_4 = Course.create(name:"Math", description: "Learn about Math!")
