class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        self.posts.last(5)
        # ALTERNATIVE:
        # self.posts.limit(5)
    end

    def featured_post
        self.posts.max { |a, b| a.likes <=> b.likes }
    end

    def average_age
        unique_bloggers = self.bloggers.uniq
        blogger_ages = unique_bloggers.collect {|blogger| blogger.age}
        blogger_ages.sum / unique_bloggers.count
        # ALTERNATIVE:
        # self.bloggers.average(:age)
    end
end
