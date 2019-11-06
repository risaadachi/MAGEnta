class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :code

    validates :body, presence: true

end
