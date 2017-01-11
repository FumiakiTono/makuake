class ChangeFinalDateFromProjects < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :finaldate, :date
  end
end
