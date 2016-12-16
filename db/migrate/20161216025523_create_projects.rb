class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string  :title, unique: true, null: false, index: true
      t.text    :description, null: false
      t.string  :category, null: false
      t.string  :patern, null: false
      t.date    :finaldate, null: false
      t.integer :currentprice, null: false, index: true
      t.integer :finalprice, null: false
      t.timestamps
    end
  end
end
