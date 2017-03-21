class EateriesController < ApplicationController
  before_action :set_eatery, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :allowed_to_create_eatery, only: [:edit, :new, :create]
  helper_method :owner?
  helper_method :patron?
  # GET /eateries
  # GET /eateries.json
  def index
    @eateries = Eatery.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    #@user = User.owner?

  end

  # GET /eateries/1
  # GET /eateries/1.json
  def show
    #debugger
    @reservation = Reservation.new
    #debugger
  end

  # GET /eateries/new
  def new
    @eatery = current_user.eateries.build

  end

  # GET /eateries/1/edit
  def edit
  end

  # POST /eateries
  # POST /eateries.json
  def create
    @eatery = current_user.eateries.build(eatery_params)

    if @eatery.save
      redirect_to @eatery, notice: 'Eatery was successfully created.'
    else
      render :new
    end

    #debugger
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

    def correct_user
      @eatery = current_user.eateries.find_by(id: params[:id])
      redirect_to eateries_path, notice: "Not authorized to edit this User" if @eatery.nil?
    end

    def allowed_to_create_eatery
      redirect_to eateries_path, notice: "Not authorized to create or edit an Eatery" if current_user.patron?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def eatery_params
      params.require(:eatery).permit(:name, :image, :address, :description)
    end
end
