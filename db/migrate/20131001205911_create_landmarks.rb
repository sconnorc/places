class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
