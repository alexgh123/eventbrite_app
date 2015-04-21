class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new()
  end

  def show
    @user = User.find(params[:id])
    # sql injection suceptible
  end

  private

    # def user_params
    #   params.require(:user).permit(:id, :name, :email)
    # end

end
