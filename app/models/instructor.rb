class Instructor < ApplicationRecord
    belongs_to :user, required: false

    has_many :course_instructors

    has_many :courses, through: :course_instructors
end
