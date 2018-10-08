class AddIdToRecettes < ActiveRecord::Migration[5.2]
  def change
    add_column :recettes, :user_id, :integer
  end
end
