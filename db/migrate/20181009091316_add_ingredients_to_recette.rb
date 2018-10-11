class AddIngredientsToRecette < ActiveRecord::Migration[5.2]
  def change
    add_column :recettes, :'ingrédients', :string
  end
end
