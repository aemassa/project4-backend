class ProfilesController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]

# https://www.zipcodeapi.com/rest/<api_key>/radius.<format>/<zip_code>/<distance>/<units>

# https://www.zipcodeapi.com/rest/OTxhLB8S5nuF1UwnlmXnuFIUJUckGQjvKRNvsVoyjSdkNKI96FxBlgw4aIpRyImj/radius.json/01089/10/mile

# create arguments for zip and miles?
def zips
  response = HTTParty.get("https://www.zipcodeapi.com/rest/#{ENV['API_KEY']}/radius.json/#{params[:zip]}/20/mile")
  # byebug
  response['zip_codes'].map {|e| e['zip_code']}
end

  def index
    if params[:zip]
      @profiles = Profile.where(zip: zips)
    else
      @profiles = Profile.all
    end
    render json: @profiles
    #render json: current_photographer.profile
  end

  def show
    render json: Profile.find(params[:id])
  end

  def create
    # profile = current_photographer.profiles.create(profile_params)
    profile = current_photographer.build_profile(profile_params)
    if profile.save
      render json: profile
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def update
    profile = Profile.find(params[:id])
    if profile.update(profile_params)
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

  # def self.search(query)
  #   where("zip like ?", )
  # end

  private
  def profile_params
    params.require(:profile).permit(:name, :email, :website, :phone, :city, :state, :zip, :image)
  end
end
