class CreateStudentsCourses < ActiveRecord::Migration
  def change
    create_table :students_courses do |t|
      t.belongs_to :userid
      t.belongs_to :course_id
    end
  end
end
