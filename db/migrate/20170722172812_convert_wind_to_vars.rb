class ConvertWindToVars < ActiveRecord::Migration[5.1]
  def change
    remove_index :readings, :wind_id
    remove_column :readings, :wind_id
    add_column :readings, :wind_speed, :decimal
    add_column :readings, :wind_direction, :decimal
  end
end
