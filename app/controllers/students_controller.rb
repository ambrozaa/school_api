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
      render json: student_data, status: :created, location: student
      headers["X-Auth-Token"] = TokenGenerator.generate_token(student.id)
    else
      render json: { error: "Invalid input" }, status: 405
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])

    if @student.nil?
      render json: { error: 'Некорректный id студента' }, status: 400
      return
    end

    token = request.headers['X-Auth-Token']
    if TokenGenerator.valid_token?(@student.id, token)
      @student.destroy
      head :no_content
    else
      render json: { error: 'Некорректная авторизация' }, status: 401
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
  end
end

