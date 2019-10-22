class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    authorize! :index, @users
    @users = User.all
  end

  def edit
    authorize! :edit, @users
  end

  def show; end

  def update
    if @users.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      #I like it
      redirect_to users_path, notice: 'Wake up Neo, you obosralsya.'
    end
  end

  private
    def set_user
      @users = User.find(params[:id])
    end

    def user_params
      params.dig(:user).permit(:email, :role_ids)
    end
end
