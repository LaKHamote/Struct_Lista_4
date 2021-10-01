class Language < ApplicationRecord
  belongs_to :teacher, optional: true

  validates :name,  presence: true, uniqueness: true
  validates_uniqueness_of :teacher_id, {message: ->(object,data) do
    "-> I'm sorry, seems that, #{Teacher.find(data[:value]).name}, is already teaching #{Teacher.find(data[:value]).language.name}. Please, select a new teacher for #{object.name}."
  end}
end
