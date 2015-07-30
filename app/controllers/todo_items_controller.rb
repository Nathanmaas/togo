class TodoItemsController < ApplicationController

  def index
    @todo_items = TodoItem.all
    @todo_item = TodoItem.new
  end

  def create
    @todo_item = TodoItem.create
    redirect_to todo_items_path
  end

  def new
    @todo_item = TodoItem.new
  end

  def show
    @todo_item = TodoItem.find(params[:id])
  end

  def edit
    @todo_item = TodoItem.find(params[:id])
  end

  def update
    @todo_item.update todo_params
    if todo_item.save
    redirect_to todo_items_path
    else
    render :edit
    end
  end

  private
  def todo_params
    params.require(:todo_item).permit(:place, :link)
  end

end
