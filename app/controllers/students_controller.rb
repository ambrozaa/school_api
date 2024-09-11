class StudentsController < ApplicationController
  def create
    student = Student.new(student_params)
    if student.save
      student_data = { id: student.id,
                       first_name: student.first_name,
                       last_name: student.last_name,
                       surname: student.surname,
                       class_id: student.class_id,
                       school_id: student.school_id
      }
      render json: student_data.as_json.merge({ auth_token: student.auth_token }), status: :created, location: student
    else
      render json: { error: "Invalid input" }, status: 405
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

