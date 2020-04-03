class UsersController < ApplicationController
  def show
    
  end
  
  def posts_show
    @microposts = Micropost.all
  end

  
  def all_users
    @users = User.all
  end
end
