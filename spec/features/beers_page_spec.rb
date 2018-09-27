require 'rails_helper'

include Helpers

describe "Beer" do
  let!(:user) { FactoryBot.create :user }
  let!(:brewery) { FactoryBot.create :brewery}

  before :each do
    #FactoryBot.create :brewery
  end

  describe "beer creation and editing" do
    it "can create new beer with proper name" do
      sign_in(username: "Pekka", password: "Foobar1")

      visit new_beer_path
      # save_and_open_page

      fill_in('beer_name', with:'Olut')

      expect{
        click_button('Create Beer')
      }.to change{Beer.count}.by(1)
    end

      it "cannot create new beer without name" do
        sign_in(username: "Pekka", password: "Foobar1")
        
        visit new_beer_path

        fill_in('beer_name', with:'')
        click_button('Create Beer')

        expect(page).to have_content "Name can't be blank"
        expect{
          click_button('Create Beer')
        }.to change{Beer.count}.by(0)
      end

    # it "is redirected back to signin form if wrong credentials given" do
    #   sign_in(username: "Pekka", password: "wrong")

    #   expect(current_path).to eq(signin_path)
    #   expect(page).to have_content 'Username and/or password mismatch'
    # end

    # it "when signed up with good credentials, is added to the system" do
    #   visit signup_path
    #   fill_in('user_username', with:'Brian')
    #   fill_in('user_password', with:'Secret55')
    #   fill_in('user_password_confirmation', with:'Secret55')

    #   expect{
    #     click_button('Create User')
    #   }.to change{User.count}.by(1)
    # end
  end
end