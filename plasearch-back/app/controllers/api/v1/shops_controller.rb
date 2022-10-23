class Api::V1::ShopsController < ApplicationController

  # ↓ページネーションなど何かしらの対策要
  def index 
    @shops = Shop.all
    render json: @shops
  end

  def show
    @shop = Shop.find(params[:id])
    if current_user
    favorite = Favorite.find_by(user_id: @current_user.id, shop_id: @shop.id)
      render json: { shop: @shop, favorite: favorite },
             status: :ok #200
    else
      render json: { shop: @shop},
             status: :accepted #202
    end
  end

  # 店舗情報 追加・更新・削除機能 実装中
  # def create
  #   @shop = Shop.create(name: params[:name])
  #   render json: @shop
  # end

  # def update
  #   @shop = Shop.find(params[:id])
  #   @shop.update_attributes(name: params[:name])
  #   render json: @shop
  # end

  # def destroy
  #   @shop = Shop.find(params[:id])
  #   if @shop.destroy
  #     head :ok
  #     head :no_content, status:ok
  #   else
  #     render json: @shop.errors, status: :unprocessable_entity
  #   end
  # end

  # 実装中
  # def keyword
  #   if params[:name]
  #     shops = Shop.where(name: params[:name])
  #   elsif params[:keyword]
  #     keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
  #     shops = []
  #     keywords.each do |keyword|
  #       shops += Shop.where('name LIKE (?) OR address LIKE (?) OR near_station LIKE (?) OR introduction LIKE (?) OR company LIKE (?)',"%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
  #     end
  #   else
  #     pagy, shops = pagy(Shop.all)
  #     pagy_headers_merge(pagy)
  #   end
  #   render json: shops
  # end

end
