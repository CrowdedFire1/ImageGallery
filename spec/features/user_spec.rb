require "rails_helper"

RSpec.describe "Logging In", type: :feature do
  let!(:user) { FactoryBot.create(:user) }
  specify "I can log in with valid email and password" do
    visit new_user_session_path

    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "Password1234"
    click_button "Log in"
    expect(page).to have_content "Create New Gallery"
  end

  specify "I can not log in with invalid email and password" do
    visit new_user_session_path

    fill_in "user_email", with: "toast@test.com"
    fill_in "user_password", with: "Password1234"
    click_button "Log in"

    expect(page).to have_content "Invalid Email or password."
  end

  specify "I can sign up a new user" do
    visit new_user_registration_path

    fill_in "Name", with: "Test"
    fill_in "Email", with: "test1@test.com"
    fill_in "Password", with: "Password1234"
    fill_in "Password confirmation", with: "Password1234"
    click_on "Sign up"
  end
end
