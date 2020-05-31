# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
    Created Student and Courses models.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    Student has_many Courses
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Course belongs_to Student
- [x] Include user accounts with unique login attribute (username or email)
    Email used for sign-in/sign-up
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Full CRUD capabilities for Courses. Restful Routes are consistent
- [x] Ensure that users can't modify content created by other users
    Students who are not logged in cannot edit any courses or see any courses. Students who are logged in but do not match courses user_id are not able to edit.
- [x] Include user input validations
    Blank forms will not submit
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message