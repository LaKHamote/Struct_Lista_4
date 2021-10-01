class Api::V1::TeachersController < ApplicationController
  def index
    teachers = Teacher.all
    render json: teachers, status: :ok
  end

  def show
    teacher = Teacher.find(params[:id])
    render json: teacher, status: :found
  rescue StandardError
    head(:not_found)
  end

  def create
    new_teacher = Teacher.new(teacher_params)
    new_teacher.save!
    render json: new_teacher, status: :created
  rescue StandardError
    head(:unprocessable_entity)
  end

  def update
    teacher = Teacher.find(params[:id])
    teacher.update!(teacher_params)
    render json: teacher, status: :accepted
  rescue StandardError => e
    render json: {message: e.message}, status: :unprocessable_entity
  end

  def delete
    teacher = Teacher.find(params[:id])
    teacher.destroy!
    render json: teacher, status: :accepted
  rescue StandardError => e
    render json: {message: e.message}, status: :unprocessable_entity
  end

  def my_students
    students = Teacher.find(params[:id]).students
    if students.empty?
      render json: {message: "This teacher doesn't have any students"}, status: :no_content
    else
      render json: students, status: :found
    end
  rescue StandardError
    head(:not_found)
  end

  private

  def teacher_params
    params.require(:teacher).permit(
      :name,
      :email,
      :birth_date
    )
  end

end
