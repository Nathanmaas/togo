class AddColumnToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :link, :string
  end
end
