class Character < ApplicationRecord
  belongs_to :project
  has_many :chapter_characters, dependent: :destroy
  has_many :chapters, through: :chapter_characters, dependent: :destroy
  validates :name, presence: true
end
