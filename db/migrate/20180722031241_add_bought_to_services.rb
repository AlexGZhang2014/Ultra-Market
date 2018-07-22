class AddBoughtToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :bought, :boolean, default: false
  end
end
