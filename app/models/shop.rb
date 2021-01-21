class Shop < ApplicationRecord
    belongs_to :user
    acts_as_votable
    has_many :comments, dependent: :destroy
    is_impressionable
    # has_many_attached :user_shots
    has_many_attached :images
    validates :title, presence: true
    validates :description, presence: true
    validate :image_type

    def thumbnail input
        return self.images[input].variant(resize: "300x300!").processed
    end

    def full input
        return self.images[input].variant(resize: "800x700!").processed
    end

    private

    def image_type
        if images.attached? == false
            errors.add(:images, "are missing!")
        end
        images.each do |image|
            if !image.content_type.in?(%(image/jpeg image/png image/svg image/jpg))
                errors.add(:images, "need to be either jpes, png, svg or jpg")
            end
        end
    end
end
