class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	# GET /users
  	# GET /users.json
	def index
		@users = User.all
	end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end

  end

  def test
    debugger
    logger.debug "Test Log: #{:id}"
    @user = User.find(params[:id])
    logger.debug "Test Log: #{@user.role}"
    if @user.role == "patron"
      @user.role = "owner"
    else
      @user.role = "patron"
    end
    logger.debug "Test Log: #{@user.role}"
    logger.debug "Test Log: #{@user.name}"
    @user.save
    redirect_to :back, flash: {notice: "User is now an #{@user.role}"}
  end


  # PATCH/PUT /user/1
  # PATCH/PUT /user/1.json
  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to index, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :role)
    end
end
