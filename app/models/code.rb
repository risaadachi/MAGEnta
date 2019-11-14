class Code < ApplicationRecord

has_many :codetags, foreign_key: :code_id, dependent: :destroy
	has_many :tags, through: :codetags
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
  	belongs_to :user

  # optional: true 外部キーnilでもいける記述

    # active_storageの記述
    has_many_attached :photos

    with_options presence: true do
  	  validates :title
  	  validates :body
      validates :user_id
    end
    # def thumbnail input
    #   return self.photos[input].variant(resize: '200x200!').processed
    # end
# !をつけたらオリジナル画像のサイズを無視してリサイズできる


    is_impressionable counter_cache: true
    # pv で閲覧したコーデを識別。コントローラのimpressionistの@codeがそれ
    #  counter_cache: true　いるやつやった



  def save_codes(tags)
    unless self.tags.nil?
      current_tags = self.tags.pluck(:tagname)
    end
    # tagsテーブルのtagnameカラムを取り出す。空やったら作るやで
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy
    old_tags.each do |old_tagname|

      self.tags.delete Tag.find_by(tagname:old_tagname)
   end

    # Create
    new_tags.each do |new_tagname|
      code_tag = Tag.find_or_create_by(tagname:new_tagname)
      self.tags.push(code_tag)
      # self.tags.push(code_tag)と一緒の意味
    end
  end
end
