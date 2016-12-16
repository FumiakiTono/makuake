class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string     :name, unique: true, null: false, index: true
      t.string     :image
      t.references :product, foreign_key: true
      t.integer    :count
      t.timestamps
    end
  end
end
