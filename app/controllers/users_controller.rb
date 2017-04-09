class UsersController < ApplicationController
  before_action :set_user, only: [:preferences, :update]

  def index
    @users = User.all
  end

  def preferences
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to preferences_path(@user), notice: 'User was successfully updated.' }
        format.json { render :preferences, status: :ok, location: preferences_path(@user) }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:theme)
  end

end
