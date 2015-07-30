class RenameTodosTableToTodoItems < ActiveRecord::Migration
  def change
    rename_table :todos, :todo_items
    t.references :user, foreign_key: true
  end
end
