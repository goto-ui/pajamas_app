class MicropostsController < ApplicationController
  
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

  # def destroy
  #   @micropost.destroy
  #   flash[:success] = "Micropost deleted"
  #   redirect_to request.referrer || @micropost.user
  # end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
  #   def correct_user
  #     @micropost = current_user.microposts.find_by(id: params[:id])
  #     redirect_to root_url if @micropost.nil?
  #   end
end
