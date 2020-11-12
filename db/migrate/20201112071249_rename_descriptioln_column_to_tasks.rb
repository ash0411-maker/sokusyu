class RenameDescriptiolnColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :descriptioln, :description
  end
end
