class SchoolClassesController < ApplicationController
  def students
    school_class = SchoolClass.find_by(id: params[:class_id], school_id: params[:school_id])
    if school_class
      students = school_class.students
      students_data = students.map do |student|
        { id: student.id,
          first_name: student.first_name,
          last_name: student.last_name,
          surname: student.surname,
          class_id: student.class_id,
          school_id: student.school_id
        }
      end
      render json: { data: students_data }, status: 200
    else
      # Убрать, если не нужен (в задании информации нет)
      render json: { error: 'Класс не найден' }, status: 400
    end
  end

=begin
  def students
    school_class = SchoolClass.find_by(id: params[:class_id], school_id: params[:school_id])
    if school_class
      students = school_class.students
      render json: { data: students }, status: 200
    else
      render json: { error: 'Class not found' }, status: :not_found
    end
  end
=end

end