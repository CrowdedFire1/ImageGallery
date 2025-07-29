require "rails_helper"

RSpec.describe "Gallery Actions", type: :feature do
  let!(:user) { FactoryBot.create(:user) }
  let!(:gallery) { FactoryBot.create(:gallery, user_id: user.id) }
  let!(:photo) { FactoryBot.create(:photo, user_id: user.id) }

  before do |test|
    if !test.metadata[:skip_login]
      visit new_user_session_path

      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "Password1234"
      click_button "Log in"
    end
  end

  specify "I can view a gallery without being logged in", :skip_login do
    visit galleries_path
    expect(page).to have_content "Galleries"

    visit gallery_path(gallery)
    expect(page).to have_content "This is a test."
  end

  specify "I can create a gallery" do
    visit new_gallery_path

    fill_in "Name", with: "TestingGallery"
    fill_in "Description", with: "This is a test."

    click_on "Create Gallery"

    expect(page).to have_content "Gallery was successfully created."
  end

  specify "I can add a picture on a gallery that I own" do
    visit gallery_path(gallery)

    click_button "Upload a photo"

    attach_file "Image", Rails.root.join("spec/fixtures/tree1.jpeg")
    fill_in "Alt text", with: "A tree"
    click_button "Create Photo"

    expect(page).to have_css("img[alt='A tree']")
  end

  specify "I can delete a picture on a gallery that I own" do
    # adding photo to gallery

    visit gallery_path(gallery)

    click_button "Upload a photo"

    attach_file "Image", Rails.root.join("spec/fixtures/tree1.jpeg")
    fill_in "Alt text", with: "A tree"
    click_button "Create Photo"

    expect(page).to have_css("img[alt='A tree']")

    # start of delete test
    click_button "Delete"
    expect(page).to have_content "Photo was successfully destroyed."
  end

  specify "I can edit a picture on a gallery that I own" do
    # adding photo to gallery
    visit gallery_path(gallery)

    click_button "Upload a photo"

    attach_file "Image", Rails.root.join("spec/fixtures/tree1.jpeg")
    fill_in "Alt text", with: "A tree"
    click_on "Create Photo"

    expect(page).to have_css("img[alt='A tree']")

    # start of edit test
    click_on "Edit"
    fill_in "Alt text", with: "This is a toast."
    click_button "Update Photo"
    expect(page).to have_content "Photo was successfully updated."
  end
end
