class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
    render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome to the Theme Park!"
    else
      redirect_to new_user_path(@user), notice: "There was an error registering you."
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user), notice: "User was successfully updated."
  end

  def destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
    end
end