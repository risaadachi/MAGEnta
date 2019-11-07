class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :codes, dependent: :destroy

   # active_storageの記述
    has_one_attached :profile_image

  with_options presence: true do
  	validates :name
  	validates :gender
  	validates :height
  end

  with_options uniqueness: true do
  	validates :email
  end

end
