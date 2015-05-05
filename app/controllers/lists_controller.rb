class ListsController < ApplicationController
  def index
    @lists = List.includes(:tasks).where(status: "unarchived")
  end
end
