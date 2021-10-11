class StudentSerializer < ActiveModel::Serializer
  attributes :id, :profile_picture_url, :name, :registration, :email, :birth_date, :current_learning, :current_teacher

  def current_learning
    object.teacher.language.name
  end

  def current_teacher
    object.teacher.name
  end

  def profile_picture_url
    if object.profile_picture.attached?
      Rails.application.routes.url_helpers.rails_blob_path(object.profile_picture, only_path: true)
    end
  end

end
