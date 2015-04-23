class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :show, :index]

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
      log_in @user
      flash[:success] = "You have been self actualized..."
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end
