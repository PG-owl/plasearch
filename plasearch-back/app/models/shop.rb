class Shop < ApplicationRecord
  
  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  # validates :phone_number, presence: true
  # validates :post_code, presence: true
  # validates :address, presence: true
  # validates :opening_hours, presence: true
  # validates :holiday_opening_hours, presence: true
  validates :photo_reference, presence: true
  # validates :rating, presence: true
  # validates :site_url, presence: true

  has_many :favorites, dependent: :destroy     # 記事/お気に入り → 1:多

  # React側でsearch機能を実装したため、一時コメントアウト
  # def self.search(search) #self.はShop.を意味する
  #   if search
  #     where(['username LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
  #   else
  #     all #全て表示させる
  #   end
  # end

end
