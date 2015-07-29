class TodoItemsController < ApplicationController

  def index
    @todo_items = TodoItem.all
  end

  def show
    @todo_item = TodoItem.find(params[:id])
  end

  def new
    @todo_item = TodoItem.new
  end

  def create
    @todo_item = TodoItem.create
  end



end
