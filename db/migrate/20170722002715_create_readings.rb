class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.references :location, foreign_key: true
      t.string :conditions
      t.decimal :pressure
      t.decimal :temperature
      t.references :wind, foreign_key: true
      t.decimal :humidity
      t.datetime :time
      t.datetime :sunrise
      t.datetime :sunset
      t.decimal :cloudiness

      t.timestamps
    end
  end
end
