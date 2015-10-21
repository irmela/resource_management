class RessourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ressource, only: [:show, :edit, :update, :destroy]

  # GET /ressources
  # GET /ressources.json
  def index
    @ressources = Ressource.all
  end

  # GET /ressources/1
  # GET /ressources/1.json
  def show
  end

  # GET /ressources/new
  def new
    @ressource = Ressource.new
  end

  # GET /ressources/1/edit
  def edit
  end

  # POST /ressources
  # POST /ressources.json
  def create
    @ressource = Ressource.new(ressource_params)

    respond_to do |format|
      if @ressource.save
        format.html { redirect_to ressources_path, notice: 'Ressource was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /ressources/1
  # PATCH/PUT /ressources/1.json
  def update
    respond_to do |format|
      if @ressource.update(ressource_params)
        format.html { redirect_to ressources_path, notice: 'Ressource was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /ressources/1
  # DELETE /ressources/1.json
  def destroy
    @ressource.destroy
    respond_to do |format|
      format.html { redirect_to ressources_url, notice: 'Ressource was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ressource
      @ressource = Ressource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ressource_params
      params.require(:ressource).permit(:name, :department, :color, :status)
    end
end
