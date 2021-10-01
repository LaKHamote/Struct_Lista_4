class Language < ApplicationRecord
  belongs_to :teacher, optional: true
  validates :name,  presence: true, uniqueness: true
end
