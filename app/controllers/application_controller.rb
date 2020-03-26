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
          @posts = Post.search(params[:word_search]).where(user_id: true_users).includes([:user,:prefecture]).page(params[:page])
      elsif params[:sort_select] == "いいね数順"
          # @posts = Post.where(user_id: true_users).search(params[:word_search]).sort{|a,b| b.favorites.size <=> a.favorites.size}
          @posts = Kaminari.paginate_array(Post.where(user_id: true_users).includes([:user,:prefecture]).search(params[:word_search]).sort{|a,b| b.favorites.size <=> a.favorites.size}).page(params[:page])
      elsif params[:sort_select] == "コメント数順"
          # @posts = Post.where(user_id: true_users).search(params[:word_search]).sort{|a,b| b.comments.size <=> a.comments.size}
          @posts = Kaminari.paginate_array(Post.where(user_id: true_users).includes([:user,:prefecture]).search(params[:word_search]).sort{|a,b| b.comments.size <=> a.comments.size}).page(params[:page])
      elsif params[:sort_select] == ""
          @posts = Post.search(params[:word_search]).where(user_id: true_users).includes([:user,:prefecture]).page(params[:page])
      else
          @posts = Post.where(user_id: true_users).includes([:user,:prefecture]).page(params[:page])
      end
  end

  def true_users
      users = User.where(status: true)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:phone_number,:email])
  end
end
