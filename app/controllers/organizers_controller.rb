class OrganizersController < ApplicationController
  before_action :set_organizer, only: %i[ show edit update destroy merge paragon]

  # GET /organizers
  def index
    @organizers = Organizer.all
  end

  # GET /organizers/1
  def show
  end

  # GET /organizers/new
  def new
    @organizer = Organizer.new
  end

  # GET /organizers/1/edit
  def edit
  end

  # POST /organizers
  def create
    @organizer = Organizer.new(organizer_params)

    if @organizer.save
      redirect_to @organizer, notice: "Organizer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizers/1
  def update
    if @organizer.update(organizer_params)
      redirect_to @organizer, notice: "Organizer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /organizers/1
  def destroy
    @organizer.destroy
    redirect_to organizers_url, notice: "Organizer was successfully destroyed.", status: :see_other
  end

  def merge
  end

  def paragon
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organizer_params
      params.require(:organizer).permit(:email)
    end
end
