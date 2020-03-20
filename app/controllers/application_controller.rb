class ApplicationController < ActionController::Base
# サインアップ時にパラメーターで受け取れるデータの種類を増やす
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_top_path
      when User
        root_path
      end
  end

  def after_sign_up_path_for(resource)
      root_path
  end
  def after_inactive_sign_up_path_for(resource)
      root_path
  end

  def after_sign_out_path_for(resource)
      root_path
  end
  # 投稿並び替え
  def post_sort
      if params[:sort_select] == "新着順"
          words = Post.search(params[:word_search])
          @posts = words.all
      elsif params[:sort_select] == "いいね数順"
          words = Post.search(params[:word_search])
          @posts = words.sort{|a,b| b.favorites.size <=> a.favorites.size}
      elsif params[:sort_select] == "コメント数順"
          words = Post.search(params[:word_search])
          @posts = words.sort{|a,b| b.comments.size <=> a.comments.size}
      elsif params[:sort_select] == ""
          words = Post.search(params[:word_search])
          @posts = words.all
      else
          @posts = Post.all
      end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:phone_number,:email,:post_code,:prefecture_code,:address_city,:address_street])
  end
end
