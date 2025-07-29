# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

testuser = User.where(email: "test@test.com").first_or_create(password: "Password1234", password_confirmation: "Password1234", name: "TestUser")

testuser1 = User.where(email: "test1@test.com").first_or_create(password: "Password1234", password_confirmation: "Password1234", name: "TestUser1")

photo_array = []
(1..5).each do |i|
  testPhoto = Photo.where(alt_text: "This is a stock image of tree #{i}.").first_or_create(user_id: testuser.id)
  testPhoto.image.attach(io: File.open(Rails.root.join("db/seed_files/tree#{i}.jpeg")), filename: "tree#{i}.jpeg", content_type: "image/jpeg")
  testPhoto.save!
  testPhoto.create_thumbnail(testPhoto)
  photo_array << testPhoto
end

testGallery1 = Gallery.where(name: "TestGallery1").first_or_create(description: "Welcome to Curate-A-Gallery", hidden: false, user_id: testuser.id)
photo_array.each do |photo|
  testGallery1.photos << photo unless testGallery1.photos.include?(photo)
end

testGallery2 = Gallery.where(name: "TestGallery2").first_or_create(description: "This is gallery is not public.", hidden: true, user_id: testuser1.id)
photo_array.each do |photo|
  testGallery2.photos << photo unless testGallery2.photos.include?(photo)
end

Gallery.where(name: "TestGallery3").first_or_create(description: "This is a blank gallery", hidden: "false", user_id: testuser1.id)
