class Codetag < ApplicationRecord

	belongs_to :code, optional: true
	belongs_to :tag, optional: true
	validates :code_id, presence: true
	validates :tag_id, presence: true
end
