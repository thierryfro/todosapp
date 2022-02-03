class Task < ApplicationRecord
  belongs_to :todo

  # validations
  validates_presence_of :title
end
