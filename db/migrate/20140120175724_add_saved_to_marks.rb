class AddSavedToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :saved, :boolean, :default => false
  end
end
