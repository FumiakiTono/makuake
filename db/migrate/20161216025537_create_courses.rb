class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table   :courses do |t|
      t.string     :name, unique: true, null: false, index: true
      t.string     :image
      t.references :project, foreign_key: true
      t.integer    :price, null: false, index: true
      t.string     :count
      t.timestamps
    end
  end
end
