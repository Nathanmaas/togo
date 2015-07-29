class RenameTodosTableToTodoItems < ActiveRecord::Migration
  def change
    rename_table :todos, :todo_items
  end
end
