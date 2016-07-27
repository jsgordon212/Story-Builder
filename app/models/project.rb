class Project < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :characters, through: :chapters, source: :chapter_characters
  has_many :plot_points, through: :chapters
  validates :title, presence: true
end
