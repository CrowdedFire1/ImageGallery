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
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
