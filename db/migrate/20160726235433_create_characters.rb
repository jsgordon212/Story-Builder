class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.references :project, foreign_key: true, index: true
      t.references :chapter, foreign_key: true
      t.string :name, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
