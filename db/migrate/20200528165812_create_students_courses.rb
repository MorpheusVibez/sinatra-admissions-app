class CreateStudentsCourses < ActiveRecord::Migration
  def change
    create_table :students_courses do |t|
      t.integer :userid
      t.integer :course_id
  end
end
