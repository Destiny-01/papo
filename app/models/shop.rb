class Shop < ApplicationRecord
  belongs_to :user
  acts_as_votable
  has_many_attached :image
  has_many :comments, dependent: :destroy
  is_impressionable
    # has_many_attached :shots
  mount_uploaders :shots, ShotUploader
    mount_uploaders :user_shots, UserShotUploader
  serialize :shots, JSON
  serialize :user_shots, JSON
    validates :title, presence: true
    validates :description, presence: true
    validate :image_type

    def thumbnail input
        return self.image[input].variant(resize: "300x300!").processed
    end

    def full input
        return self.image[input].variant(resize: "1000x700!").processed
    end

    private

  def image_type                             
    # return unless image.attached?
    if image.attached? == false
      errors.add(:image, "are missing!")
    end
    image.each do |image|
        if !image.content_type.in?(%(image/jpeg image/png image/svg image/jpg))
            errors.add(:image, "need to be either jpeg, png, svg or jpg")
        end
    end
    if image.count > 3
        errors.add(:image, "are greater than 3")
    end
  end
end
