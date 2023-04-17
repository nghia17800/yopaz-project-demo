require 'rails_helper'

RSpec.describe "Signup", type: :feature do
  describe "GET /users/sign_up" do
    it "renders the sign up form" do
      visit '/users/sign_up'
      expect(page).to have_content("Sign up")
      expect(page).to have_field("User name")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Password confirmation")
      expect(page).to have_button("Sign up")
    end
  end

  describe "POST /users" do
    context "with valid params" do
      it "creates a new user" do
        visit '/users/sign_up'
        fill_in "User name", with: "test"
        fill_in "Email", with: "test@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
        
        expect(User.count).to eq(1)
        expect(User.first.email).to eq("test@example.com")
      end
    end

    context "with invalid params" do
      it "does not create a new user" do
        visit '/users/sign_up'
        fill_in "Email", with: "invalid_email"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "wrong_password"
        click_button "Sign up"

        expect(User.count).to eq(0)
      end
    end
  end
end