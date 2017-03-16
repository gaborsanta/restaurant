class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    #@reservations = Reservation.all
    @reservations = current_user.reservations
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new

  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    #@reservation = current_user.reservations.build(eatery_params)

    #debugger
    @reservation.user_id = current_user.id


    if @reservation.save
      #debugger
      redirect_to @reservation, notice: 'Reservation was successfully created.'
    else
      #debugger
      render :new
    end

  end


  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
      if @reservation.update(reservation_params)
        redirect_to @reservation, notice: 'Reservation was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
      redirect_to reservations_url, notice: 'Reservation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:name,:email, :party_size, :date, :time, :comment, :eatery_id, :user_id)
    end
end
