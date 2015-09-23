class PhotosController < ApplicationController
  skip_before_action :authenticate#, only: :index

  def index
    render json: Photo.where(profile_id: params[:profile_id])
  end

  def show
    render json: Photo.where(profile_id: params[:profile_id]).find(params[:id])
  end

  def create
    profile = Profile.find(params[:profile_id])
    photo = profile.photos.build(photo_params)

    if photo.save
      render json: photo
    else
      render json: photo.errors, status: :unprocessable_entity
    end
  end

  def update
    photo = Photo.find(params[:id])
    if photo.update(photo_params)
      photo.save
      render json: photo
    else
      render json: photo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy!
    head :ok
  end

  private
  def photo_params
    params.require(:photo).permit(:caption, :gallery_image)
  end
end
