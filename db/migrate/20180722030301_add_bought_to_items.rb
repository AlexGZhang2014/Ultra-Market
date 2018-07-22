class AddBoughtToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :bought, :boolean, default: false
  end
end
