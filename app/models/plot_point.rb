class PlotPoint < ApplicationRecord
  belongs_to :chapter, optional: true
  belongs_to :project
end
