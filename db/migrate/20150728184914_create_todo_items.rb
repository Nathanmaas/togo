class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.integer :todo_id
      t.string :content

      t.timestamps
    end
  end
end
