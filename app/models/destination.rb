class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        self.posts.last(5)
    end

    def featured_post
        self.posts.max { |a, b| a.likes <=> b.likes }
    end

    def average_age
        self.bloggers.average(:age)
    end
end
