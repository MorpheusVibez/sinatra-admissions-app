class CreateStudentsCourses < ActiveRecord::Migration
  def change
    create_table :courses_students do |t|
      t.belongs_to :student
      t.belongs_to :course
    end
  end
end
