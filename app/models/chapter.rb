class Chapter < ApplicationRecord
  belongs_to :project
  has_many :plot_points, dependent: :destroy
  has_many :chapter_characters, dependent: :destroy
  has_many :characters, through: :chapter_characters, dependent: :destroy
end
