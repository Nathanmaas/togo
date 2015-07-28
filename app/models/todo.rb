class Todo < ActiveRecord::
  belongs_to :user
  has_many :todo_items
  # before_create :set_sort

end
