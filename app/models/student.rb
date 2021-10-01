class Student < ApplicationRecord
  belongs_to :teacher, optional: true
  validates_presence_of :name, :registration, :email, :birth_date
  validates :email, email:true
  validates_length_of :registration, is: 9
  validates_date :birth_date, on_or_before: lambda { Date.current}
  validates_uniqueness_of :registration, :email

end
