class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      root_url  #　指定したいパスに変更
    else
      flash[:notice] = "新規登録完了しました。次に名前を入力してください" 
      users_show_path  #　指定したいパスに変更
    end
  end

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
