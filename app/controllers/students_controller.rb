class StudentsController < ApplicationController
  before_action :authenticate_request, only: [:destroy]

    def create
    student = Student.new(student_params)
    if student.save
      student_data = { id: student.id,
                       first_name: student.first_name,
                       last_name: student.last_name,
                       surname: student.surname,
                       class_id: student.class_id,
                       school_id: student.school_id,
                       auth_token: student.auth_token
      }
      render json: student_data, status: :created, location: student
      headers["X-Auth-Token"] = student.auth_token
      #headers["Authorization"] = "Bearer #{student.auth_token}"
      #headers: { 'X-Auth-Token': student.auth_token }
    else
      render json: { error: "Invalid input" }, status: 405
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student
      @student.destroy
      head :no_content
      render json: { text: 'Студент удален'}, status: 200
    else
      render json: { error: 'Некорректный id студента' }, status: 400
    end
  end

  private

  def authenticate_request
    token = request.headers['X-Auth-Token']&.split(' ')&.last
    unless valid_token?(token)
      render json: { error: 'Некорректная авторизация' }, status: 401
    end
  end

  def valid_token?(token)
    # Проверка, что токен существует в базе данных
    Student.exists?(auth_token: token)
  end

  def generate_unique_token(student_id)
    return SecureRandom.urlsafe_base64(32)
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
  end
end

