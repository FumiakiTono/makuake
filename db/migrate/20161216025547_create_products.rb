class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, unique: true, null: false, index: true
      t.string :image
      t.timestamps
    end
  end
end
