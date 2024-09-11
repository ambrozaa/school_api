class SchoolClassesController < ApplicationController
  def students
    school_class = SchoolClass.find_by(id: params[:class_id], school_id: params[:school_id])
    if school_class
      students = school_class.students
      render json: { data: students }, status: 200
    else
      render json: { error: 'Class not found' }, status: :not_found
    end
  end
end