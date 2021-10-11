class TeacherSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :profile_picture_url, :name, :email, :birth_date, :current_teaching, :current_students

  def current_students
    students = ["-> #{object.students.size}:"]
    object.students.each do |student|
      students.append student.name
    end
    students.sort
  end

  def current_teaching
    object.language.name
  end

  def profile_picture_url
    if object.profile_picture.attached?
      rails_blob_path(object.profile_picture, only_path: true)
      end
  end

end
