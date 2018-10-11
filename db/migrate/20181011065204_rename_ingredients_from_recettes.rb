class RenameIngredientsFromRecettes < ActiveRecord::Migration[5.2]
  def change
    rename_column :recettes, :'ingrédients', :ingredients
  end
end
