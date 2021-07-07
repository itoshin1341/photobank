class UsersController < ApplicationController

  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      bypass_sign_in(@user) 
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :prefecture_id, :city, :last_name, :first_name, :last_name_kana, :first_name_kana, :gender_id, :birthday, :introduction, :image )
  end
end
