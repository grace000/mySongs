class Post < ApplicationRecord
	belongs_to :user

	validates :title, presence: true, uniqueness: { scope: :user_id }
	validates :artist, presence: true
	validates :url, presence: true
	validates :user, presence: true
end
