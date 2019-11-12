class Code < ApplicationRecord

has_many :codetags, dependent: :destroy
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
  	  validates :photos
      validates :user_id
    end

    # def thumbnail input
    # 	return self.photos[input].variant(resize: '200x200!').processed
    # end
# !をつけたらオリジナル画像のサイズを無視してリサイズできる

  def save_codes(tags)
    current_tags = self.tags.pluck(:tagname) unless self.tags.nil?
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
      self.tags << code_tag
      # self.tags.push(blog_tag)と一緒の意味
    end
   end
  end
end
