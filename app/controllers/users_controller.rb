class UsersController < ApplicationController
  def show
    
  end
  
  def all_users
    @users = User.all
  end
end
