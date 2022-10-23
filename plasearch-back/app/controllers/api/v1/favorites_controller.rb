class Api::V1::FavoritesController < ApplicationController

  # お気に入り登録
  def create
    if favorite = current_user.favorites.create(user_id: @current_user.id, shop_id: params[:shop_id])
    # ログイン中のユーザーのみに許可
      render json: { favorite: favorite },
             status: :created #201
    else
      render json: { errors: ['お気に入り登録失敗'] }, 
             status: :bad_request #400
    end
  end

  # お気に入り削除
  def destroy
    if  favorite = current_user.favorites.find_by(id: params[:id])
     # ログイン中のユーザーのみに許可
      favorite.destroy
      render json: { favorite: favorite },
             status: :no_content #204
    else
      render json: { errors: ['お気に入りが存在しません']},
             status: :not_found #404
    end
  end
end
