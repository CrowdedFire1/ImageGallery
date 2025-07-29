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
FactoryBot.define do
  factory :photo do
    alt_text { "This is a test photo." }
    user_id { 0 }

    after(:build) do |photo|
      photo.image.attach(io: File.open(Rails.root.join("spec/fixtures/tree1.jpeg")), filename: "tree1.jpeg", content_type: "image/jpeg")
    end
  end
end
