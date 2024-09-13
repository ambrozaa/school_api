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
      render json: { data: classes_data }, status: 200
    else
      # Убрать, если не нужен (в задании информации нет)
      render json: { error: 'Школа не найдена' }, status: 400
    end
  end
end
