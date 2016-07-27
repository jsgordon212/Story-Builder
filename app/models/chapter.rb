class Chapter < ApplicationRecord
  belongs_to :project
  has_many :plot_points
  has_many :chapter_characters
  has_many :characters, through: :chapter_characters
end
