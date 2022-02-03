class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to todo_path(@task.todo_id), notice: "Task added to your Todo"
    else
      redirect_to todo_path(@task.todo_id), notice: "It was not possible to create the task"
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to todo_path(@task.todo_id), notice: "Task updated"
    else
      redirect_to todo_path(@task.todo_id), notice: "Could not update the task"
    end
  end

  def destroy
    @task.destroy
    redirect_to todo_path(@task.todo), notice: 'Task was successfully destroyed.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :done, :todo_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
