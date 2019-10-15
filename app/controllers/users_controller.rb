class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def edit
    authorize! :edit, @users
  end

  def show
    authorize! :show, @users
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      #I like it
      redirect_to root_path, notice: 'Wake up Neo, you obosralsya.'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.dig(:user).permit(:email, :role_ids)
    end
end
