class Codetag < ApplicationRecord

	belongs_to :code
	belongs_to :tag
	validates :coordinate_id, presence: true
	validates :tag_id, presence: true
end
