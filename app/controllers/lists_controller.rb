class ListsController < ApplicationController

  def index
    if params[:see_archive] == "true"
      @lists = List.includes(:tasks).where(status: "archived")
    else
      @lists = List.includes(:tasks).where(status: "unarchived")
    end

    respond_to do |format|
      format.html
      format.json { render :json => @lists.to_json }
    end
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(create_list_params)
    if list.save
      flash[:notice] = "List successfully created."
      redirect_to root_path
    else
      flash[:error] = "Something went wrong with creating your list"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if params[:archive]
      @list.status = "archived"
      redirect_to root_path, flash: { notice: "List Archived" } if @list.save
    else
      @list.update_attributes(update_list_params)
      if @list.save
        flash[:notice] = "List updated"
        redirect_to root_path
      else
        flash[:error] = "Pick Another Name"
        render :edit
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, flash: { error: "List Destroyed" }
  end

  private

  def create_list_params
    params.require(:list).permit(:title)
  end

  def update_list_params
    params.require(:list).permit(:title)
  end
end
