class ChapterCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :chapter
end
