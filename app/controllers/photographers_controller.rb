class PhotographersController < ApplicationController
  skip_before_action :authenticate, only: [:login, :create]
  #the line above creates an exception. skips authenticate for login and create?
  #before_action :set_user, only: [:show, :update, :destroy]

  # POST/login
  def login
    credentials = photographer_credentials
    photographer = Photographer.login(credentials[:email], credentials[:password])
    if photographer
      render json: photographer, serializer: LoginPhotographerSerializer
    else
      head :unauthorized
    end
  end
  # if Photographer.login works, token will be a value

  # GET /photographers
  # GET /photographers.json
  def index
    @photographers = Photographer.all

    render json: @photographers, each_serializer: PhotographerSerializer
  end

  # GET /photographers/1
  # GET /photographers/1.json
    def show
    if current_photographer.id == params[:id].to_i
      render json: current_photographer, serializer: CurrentPhotographerSerializer
    else
      render json: Photographer.find(params[:id])
    end
  end

  # POST /photographers
  # POST /photographers.json
  def create
    @photographer = Photographer.new(photographer_credentials)
    # @photographer.profile = Profile.new(profile_params)
    if @photographer.save
      render json: @photographer, status: :created, location: @photographer
    else
      render json: @photographer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photographers/1
  # PATCH/PUT /photographers/1.json
  def update
    @photographer = Photographer.find(params[:id])

    if @photographer.update(photographer_params)
      head :no_content
    else
      render json: @photographer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photographers/1
  # DELETE /photographers/1.json
  def destroy
    @photographer.destroy

    head :no_content
  end

  private

    def photographer_credentials
      params.require(:credentials).permit(:email, :password, :password_confirmation)
    end

    def set_photographer
      @photographer = Photographer.find(params[:id])
    end

    def photographer_params
      params.require(:photographer).permit(:email, :password, :password_confirmation)
    end
end
