class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :code

    validates :body, presence: true, length: { maximum:200 }

end
