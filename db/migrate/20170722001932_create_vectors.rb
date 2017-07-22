class CreateVectors < ActiveRecord::Migration[5.1]
  def change
    create_table :vectors do |t|
      t.decimal :direction
      t.decimal :speed

      t.timestamps
    end
  end
end
