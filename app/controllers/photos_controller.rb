class PhotosController < ApplicationController
  def destroy
    Photo.destroy(params[:id].to_i)
    redirect_to root_path, flash: { error: "Photo destroyed" }
  end
end
