class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :todos, :title, :place
  end
end
