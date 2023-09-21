# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    has_many(:enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment
    )

    has_many :enrolled_students, through: :enrollments, source: :user 

    has_many(:prerequisite,
        class_name: :Course,
        foreign_key: :prereq_id,
        primary_key: :id 
    )

    belongs_to(:advanced,
        class_name: :Course,
        foreign_key: :prereq_id,
        primary_key: :id
    )
    
end
