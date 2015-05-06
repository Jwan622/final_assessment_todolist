class TasksController < ApplicationController
  def new
    @task = Task.new
    @list = List.find(params[:list].to_i)
  end

  def create
    task = Task.new(create_task_params)
    @list = List.find(params[:task][:list].to_i)

    if task.save
      @list.tasks << task
      flash[:notice] = "Task successfully created."
      @list.save
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
    if params[:type] == "status-checkbox"
      task = Task.find(params[:id].to_i)
      task.status == "incomplete" ? task.status = "complete" : task.status= "incomplete"
      if task.save
        render nothing: true
        # apparently I couldn't use a redirect_to here, but only render nothing: true
      end
    else
      task = Task.find(params[:id].to_i)
      photo = Photo.create(update_photo_params.merge(task_id: task.id))
      if task.update_attributes(update_task_params)
        flash[:notice] = "Task Updated"
        redirect_to root_path
      else
        flash[:error] = "Something wrong with the update."
        render :edit
      end
    end
  end

  private

  def create_task_params
    params.require(:task).permit(:title, :description, :due_date)
  end

  def update_task_params
    params.require(:task).permit(:title, :description, :due_date)
  end

  def update_photo_params
    params.require(:task).permit(:avatar)
  end
end
