class Post < ApplicationRecord

    belongs_to :destination
    belongs_to :blogger

    validates :title, presence: true
    validates :content, length: { minimum: 100 }

    def increase_likes
        self.likes += 1
        self
    end

    def decrease_likes
        self.likes -= 1
        self
    end
end
