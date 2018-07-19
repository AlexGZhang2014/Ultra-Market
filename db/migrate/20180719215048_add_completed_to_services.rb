class AddCompletedToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :completed, :boolean, default: false
  end
end
