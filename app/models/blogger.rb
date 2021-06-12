class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, {presence: true, uniqueness: true}
    validates :age, numericality: { minimum: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.reduce(0) { |sum, post| sum + post.likes }
    end

    def featured_post
        self.posts.max { |a, b| a.likes <=> b.likes }
    end
end
