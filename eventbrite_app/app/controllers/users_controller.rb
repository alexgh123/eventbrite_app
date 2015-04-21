class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # sql injection suceptible
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "You have been self actualized..."
      redirect_to @user
    else
      flash[:failure] = "nope nothing created"
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end

end
