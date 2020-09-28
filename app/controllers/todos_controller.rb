class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todo_counter = Todo.todo_counter
    @todos = Todo.active.incomplete
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo list was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo list was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy 
    @todo.deleted!
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo list was successfully deleted.' }
    end
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :description, :priority, :completed_at, :deleted_at)
    end
end
