class CreateVectors < ActiveRecord::Migration[5.1]
  def change
    create_table :vectors do |t|
      t.number :direction
      t.number :speed

      t.timestamps
    end
  end
end
