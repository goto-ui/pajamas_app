class MicropostsController < ApplicationController
  before_action :correct_user,   only: :destroy
  before_action :logged_in_user, only: [:create, :destroy]
  
  def new
    @micropost = current_user.microposts.new
  end
  

  def create
    @micropost = current_user.microposts.create(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました。"
      redirect_to posts_show_path
    else
      render 'microposts/new'
    end
  end
  
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to posts_show_path
  end

  private

  def micropost_params
   params.require(:micropost).permit(:content, :picture)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to posts_show_path if @micropost.nil?
  end
end
