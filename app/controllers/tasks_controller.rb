class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(create_task_params)
    if task.save
      flash[:notice] = "Task successfully created."
      redirect_to root_path
    else
      flash[:error] = "Something went wrong with creating your task"
      render :new
    end
  end

  private

  def create_task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
