class Post < ApplicationRecord

    belongs_to :destination
    belongs_to :blogger

    def increase_likes
        self.likes += 1
        self
    end
end
