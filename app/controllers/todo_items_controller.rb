class TodoItemsController < ApplicationController

  def index
    @todo_items = TodoItem.all
    @todo_item = TodoItem.new
  end

  def create
      user = current_user
      @todo_item = user.todo_items.create todo_params
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
    render layout: false
  end

  def update
    @todo_item = TodoItem.find(params[:id])
    @todo_item.update todo_params
    if @todo_item.save
    redirect_to todo_items_path
    else
    render :edit
    end
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])
    @todo_item.delete
    redirect_to todo_items_path
  end

  private
  def todo_params
    params.require(:todo_item).permit(:place, :link)
  end
end
