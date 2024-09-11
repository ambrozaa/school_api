class SchoolsController < ApplicationController
  def classes
    school = School.find(params[:school_id])
    if school
      classes = school.school_classes
      render json: { data: classes }, status: :ok
    else
      render json: { error: 'School not found' }, status: :not_found
    end
  end
end
