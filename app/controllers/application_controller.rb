class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      posts_show_path  #　投稿一覧ページに飛ぶ
    else
      flash[:notice] = "新規登録完了しました。次に名前を入力してください" 
       users_show_path  #　プロフィール画面に飛ぶ
    end
  end

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private
    # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless !current_user.nil?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
