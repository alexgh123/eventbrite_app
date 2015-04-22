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
    # @events = Event.find(params[:id])
    @events = @user.events
    # @microposts = @user.microposts.paginate(page: params[:page])
    # ^ that is horendus, but it works, i think i need to use params or something
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
      params.require(:user).permit(:name, :email, :password, :password_digest)
    end

end
