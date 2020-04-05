class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def show
    
  end
  
  def posts_show
    @microposts = Micropost.all
  end

  
  def all_users
    @users = User.all
  end
  
    # beforeアクション

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
