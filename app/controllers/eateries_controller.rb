class EateriesController < ApplicationController
  before_action :set_eatery, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, except: [:index, :show]
  before_action :correct_owner, only: [:edit, :update, :destroy]
  # GET /eateries
  # GET /eateries.json
  def index
    @eateries = Eatery.all
  end

  # GET /eateries/1
  # GET /eateries/1.json
  def show
  end

  # GET /eateries/new
  def new
    @eatery = current_owner.eateries.build
  end

  # GET /eateries/1/edit
  def edit
  end

  # POST /eateries
  # POST /eateries.json
  def create
    @eatery = current_owner.eateries.build(eatery_params)


    if @eatery.save
      redirect_to @eatery, notice: 'Eatery was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /eateries/1
  # PATCH/PUT /eateries/1.json
  def update
      if @eatery.update(eatery_params)
        redirect_to @eatery, notice: 'Eatery was successfully updated.'
      else
        render :edit
      end

  end

  # DELETE /eateries/1
  # DELETE /eateries/1.json
  def destroy
    @eatery.destroy
    redirect_to eateries_url, notice: 'Eatery was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eatery
      @eatery = Eatery.find(params[:id])
    end

    def correct_owner
      @eatery = current_owner.eateries.find_by(id: params[:id])
      redirect_to eateries_path, notice: "Not authorized to edit this Owner" if @eatery.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eatery_params
      params.require(:eatery).permit(:name, :image, :address, :description)
    end
end
