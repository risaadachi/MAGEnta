class Tag < ApplicationRecord

	validates :tagname,presence: true, length:{maximum:50}
	has_many :codes, through: :codetags
	has_many :codetags, dependent: :destroy

	validates :tagname, presence: true
end
