class Tag < ApplicationRecord

	validates :tagname, presence: true, length:{maximum:20}
	has_many :codetags, foreign_key: :tag_id, dependent: :destroy
	has_many :codes, through: :codetags
end
