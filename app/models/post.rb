class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :comment, presence: true
end
