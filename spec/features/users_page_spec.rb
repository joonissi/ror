require 'rails_helper'

include Helpers

describe "User" do
  let!(:user) { FactoryBot.create :user }
  let!(:brewery) { FactoryBot.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryBot.create :beer, name:"iso 3", brewery:brewery }

  before :each do
    
    # FactoryBot.create :user
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username: "Pekka", password: "Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username: "Pekka", password: "wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and/or password mismatch'
    end

    it "when signed up with good credentials, is added to the system" do
      visit signup_path
      fill_in('user_username', with:'Brian')
      fill_in('user_password', with:'Secret55')
      fill_in('user_password_confirmation', with:'Secret55')

      expect{
        click_button('Create User')
      }.to change{User.count}.by(1)
    end

    it "can create rating and is shown his own page" do
      sign_in(username: "Pekka", password: "Foobar1")

      visit new_rating_path

      select('iso 3', from:'rating[beer_id]')
      fill_in('rating[score]', with:'15')
      click_button('Create Rating')

      visit user_path(user)

      expect(page).to have_content 'Has 1 rating, average 15.0'
      expect(page).to have_content 'iso 3 15 Destroy'
    end

      it "can create rating and destroy it" do
      sign_in(username: "Pekka", password: "Foobar1")

      visit new_rating_path

      select('iso 3', from:'rating[beer_id]')
      fill_in('rating[score]', with:'15')
      click_button('Create Rating')

      visit user_path(user)

      expect(page).to have_content 'Has 1 rating, average 15.0'
      expect(page).to have_content 'iso 3 15 Destroy'

      expect{
        click_link('Destroy')
      }.to change{Rating.count}.by(-1)



      
    end
  end
end