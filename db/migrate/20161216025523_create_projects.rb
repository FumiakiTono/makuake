class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string  :title, unique: true, null: false, index: true
      t.text    :description
      t.string  :category
      t.string  :patern
      t.datetime :finaldate, null: false
      t.integer :currentprice, index: true
      t.integer :finalprice, null: false
      t.timestamps
    end
  end
end
