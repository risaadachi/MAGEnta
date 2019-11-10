class Code < ApplicationRecord

	has_many :favorites, dependent: :destroy
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
	has_many :tags, through: :codetags
	has_many :codetags, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :user

  # optional: true 外部キーnilでもいける記述

    # active_storageの記述
    has_many_attached :photos

    with_options presence: true do
  	  validates :title
  	  validates :body
  	  validates :photos
      validates :user_id
    end

    # def thumbnail input
    # 	return self.photos[input].variant(resize: '200x200!').processed
    # end
# !をつけたらオリジナル画像のサイズを無視してリサイズできる

end
