class SchoolsController < ApplicationController
  def classes
    school = School.find(params[:school_id])
    if school
      classes = school.school_classes
      classes_data = classes.map do |school_class|
        {
          id: school_class.id,
          number: school_class.number,
          letter: school_class.letter,
          students_count: school_class.students_count
        }
      end
      render json: { data: classes_data }, status: :ok
    else
      render json: { error: 'School not found' }, status: :not_found
    end
  end
end
