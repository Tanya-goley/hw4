class Entry < ApplicationRecord
  belongs_to :place
  has_one_attached :image

  validate :image_format

  private

  def image_format
    return unless image.attached?

    if !image.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:image, "must be a JPG, PNG, or GIF file")
    end
  end
end
