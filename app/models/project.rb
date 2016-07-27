class Project < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :plot_points, through: :chapters, dependent: :destroy
  validates :title, presence: true
end
