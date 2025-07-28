# == Schema Information
#
# Table name: galleries
#
#  id          :bigint           not null, primary key
#  description :string
#  hidden      :boolean
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gallery_id  :integer
#  user_id     :bigint           not null
#
# Indexes
#
#  index_galleries_on_gallery_id  (gallery_id) UNIQUE
#  index_galleries_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Gallery < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :photos

  validates :description, presence: true
end
