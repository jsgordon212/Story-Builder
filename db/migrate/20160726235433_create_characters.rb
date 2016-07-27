class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :description
      t.references :project, null: false

      t.timestamps null: false
    end
  end
end