class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    # def total_likes
    #     self.posts.reduce(0) { |sum, post| sum + post.likes }
    # end

    # def featured_post
    #     self.posts.max { |a, b| a.likes <=> b.likes }
    # end
end
