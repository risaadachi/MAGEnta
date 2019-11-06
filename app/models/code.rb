class Code < ApplicationRecord

	has_many :favorites, dependent: :destroy
	has_many :tags, through: :codetags
	has_many :codetags, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :user

  with_options presence: true do
  	validates :photo
  	validates :title
  	validates :body
  end

end
