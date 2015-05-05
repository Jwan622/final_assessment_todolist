class TasksController < ApplicationController
  def new
    @task = Task.new
    @list = List.find(params[:list].to_i)
  end

  def create
    task = Task.new(create_task_params)
    list = List.find(params[:task][:list].to_i)

    if task.save
      list.tasks << task
      flash[:notice] = "Task successfully created."
      list.save
      redirect_to root_path
    else
      flash[:error] = "Something went wrong with creating your task"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
    task = Task.find(params[:id].to_i)
    if task.update_attributes(update_task_params)
      flash[:notice] = "Task Updated"
      redirect_to root_path
    else
      flash[:error] = "Something wrong with the update."
      render :edit
    end
  end

  private

  def create_task_params
    params.require(:task).permit(:title, :description, :due_date)
  end

  def update_task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end