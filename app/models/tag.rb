class Tag < ApplicationRecord

	validates :tagname,presence: true, length:{maximum:50}
	has_many :codetags, dependent: :destroy
	has_many :codes, through: :codetags

	validates :tagname, presence: true
end
