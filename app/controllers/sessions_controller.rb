class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if params[:user] == nil || params[:user].empty?
      redirect_to sessions_new_path
    elsif params[:user]
      return head(:forbidden) unless params[:password] == @user.password
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def login_params
    params.require(:user).permit(:name, :password)
  end
end
