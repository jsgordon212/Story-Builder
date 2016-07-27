class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true, index: true
      t.string     :title, null: false
      t.text       :summary

      t.timestamps null: false
    end
  end
end
