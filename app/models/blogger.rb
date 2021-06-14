class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, {presence: true, uniqueness: true}
    validates :age, numericality: { minimum: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        # inject(initial) { |memo, obj| block } → obj
        # reduce(initial) { |memo, obj| block } → obj
        # https://ruby-doc.org/core-2.4.0/Enumerable.html#method-i-reduce
        self.posts.reduce(0) { |sum, post| sum + post.likes }
        # ALTERNATIVE:
        # self.posts.collect {|post| post.likes}.sum
    end

    def featured_post
        self.posts.max { |a, b| a.likes <=> b.likes }
        # ALTERNATIVE:
        # sorted_posts = self.posts.sort {|post| post.likes}
        # sorted_posts.first
    end
end
