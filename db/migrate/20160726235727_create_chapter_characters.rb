class CreateChapterCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapter_characters do |t|
      t.references :character, foreign_key: true
      t.references :chapter, foreign_key: true

      t.timestamps null: false
    end
  end
end
