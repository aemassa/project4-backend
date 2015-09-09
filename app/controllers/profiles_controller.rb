class ProfilesController < ApplicationController
  skip_before_action :authenticate, #only: :index

  def index
    render json: Profile.all
    #render json: current_photographer.profile
  end

  def show
    render json: Profile.find(params[:id])
  end

  def create
    profile = current_photographer.profiles.create(profile_params)
    if profile.save
      render json: profile
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def update
    profile = Profile.find(params[:id])
    if profule.update(profile_params)
      profile.save
      render json: profile
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    profile = Profile.find(params[:id])
    profile.destroy!
    head :ok
  end

  def photos
    profile = Profile.find(params[:id])
    photos = profile.photos
    render json: photos
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :email, :website, :phone, :city, :state, :zip, :photographer_id)
  end
end
