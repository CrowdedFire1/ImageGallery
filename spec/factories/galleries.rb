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
FactoryBot.define do
  factory :gallery do
    name { "Test Gallery" }
    hidden { false }
    description { "This is a test." }
    user_id { 0 }
  end
end
