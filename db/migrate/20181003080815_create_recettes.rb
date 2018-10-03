class CreateRecettes < ActiveRecord::Migration[5.2]
  def change
    create_table :recettes do |t|
      t.string :title
      t.string :description
      t.string :etapes
      t.timestamps
    end
  end
end
