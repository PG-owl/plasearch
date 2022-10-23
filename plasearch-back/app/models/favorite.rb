class Favorite < ApplicationRecord
  belongs_to :user   # ユーザー/お気に入り → 1:多
  belongs_to :shop   # 記事/お気に入り    → 1:多

  # reference型を使うとデフォルトで必須バリデーションがかかる
  # validates :user_id, presence: true
  # validates_uniqueness_of :shop_id, scope: :user_id
  # バリデーション（ユーザーと記事の組み合わせは一意）
end
