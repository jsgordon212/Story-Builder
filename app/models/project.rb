class Project < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :plot_points, dependent: :destroy
  validates :title, presence: true


  def chapter_options
    options = ""
    self.chapters.each do |chapter|
      options = "<option value='#{chapter}'>#{chapter.chapter_number}</option>"
    end
    options 
  end




end
