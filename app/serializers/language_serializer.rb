class LanguageSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_teacher, :references_urls

  def current_teacher
    object.teacher.name
  end

  def references_urls
    if object.references.attached?
      all_references = []
      object.references.each do |reference|
        all_references.append Rails.application.routes.url_helpers.rails_blob_path(reference, only_path: true)
      end
      all_references
    end
  end

end
