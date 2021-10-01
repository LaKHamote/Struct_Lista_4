class Api::V1::StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students, status: :ok
  end

  def show
    student = Student.find(params[:id])
    render json: student, status: :found
  rescue StandardError
    head(:not_found)
  end

  def create
    new_student = Student.new(student_params)
    until new_student.valid?
      Student.registration = rand(10**8...10**9)
    end
    new_student.save!
    render json: new_student, status: :created
  rescue StandardError => e
    render json: {message: e.message}, status: :unprocessable_entity
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    render json: student, status: :accepted
    rescue StandardError
  end


  private

  def student_params
    params.require(:students).permit(
      :name,
      :email,
      :birth_date,
      :teacher_id
    )
  end
end
