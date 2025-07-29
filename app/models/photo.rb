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

  validates :image, presence: true, attached: true, content_type: [ "image/png", "image/jpeg" ]
  validates :alt_text, presence: true

  before_validation :alt_text_sanatiser

  def alt_text_sanatiser
    self.alt_text = ActionController::Base.helpers.strip_tags(alt_text)
  end

  # function to precompute thumbnails
  def create_thumbnail(photo)
      # generates the transformations to the thumbnail
      thumbnail = photo.image.variant(resize_to_limit: [ 100, 100 ]).processed
      thumbnail_blob = thumbnail.blob
      # downloads the image, applying the transformation
      download = StringIO.new(thumbnail.download)
      photo.thumbnail.attach(io: download, filename: thumbnail_blob.filename.to_s, content_type: thumbnail_blob.content_type)
  end
end
