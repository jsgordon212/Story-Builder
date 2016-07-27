class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.references :project, foreign_key: true, index: true
      t.integer :chapter_number, null: false, unique: true
      t.string :chapter_title

      t.timestamps null: false
    end
  end
end
