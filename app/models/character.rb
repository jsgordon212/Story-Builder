class Character < ApplicationRecord
  belongs_to :project
  has_many :chapter_characters
  has_many :chapters, through: :chapter_characters
  validates :name, presence: true
end
