class StudentsController < ApplicationController
  def create
    student = Student.new(student_params)
    if student.save
      render json: student, status: :created, location: student
    else
      render json: student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    if @student
      @student.destroy
      head :no_content
    else
      render json: { error: 'Student not found' }, status: :not_found
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
  end
end
