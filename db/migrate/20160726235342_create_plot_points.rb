class CreatePlotPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :plot_points do |t|
      t.boolean :main_plot, null: false
      t.references :chapter, foreign_key: true
      t.references :project, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
