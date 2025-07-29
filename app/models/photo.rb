# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  alt_text   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  photo_id   :integer
#  user_id    :bigint           not null
#
# Indexes
#
#  index_photos_on_photo_id  (photo_id) UNIQUE
#  index_photos_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Photo < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :galleries
  has_one_attached :image
  has_one_attached :thumbnail

  validates :image, presence: true
  validates :alt_text, presence: true

  # function to precompute thumbnails
  def create_thumbnail(photo)
      thumbnail = photo.image.variant(resize_to_limit: [ 100, 100 ]).processed
      thumbnail_blob = thumbnail.blob
      download = StringIO.new(thumbnail.download)
      photo.thumbnail.attach(io: download, filename: thumbnail_blob.filename.to_s, content_type: thumbnail_blob.content_type)
  end
end
