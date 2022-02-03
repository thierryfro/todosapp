class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todo = Todo.new

    if params["search"].present?
      @todos = Todo.search_task(params["search"])
    else
      @todos = Todo.all
    end
  end

  def show
    @task = Task.new
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: 'Todo was successfully destroyed.'
  end

  private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:name)
    end
end
