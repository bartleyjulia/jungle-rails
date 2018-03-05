require 'rails_helper'

RSpec.describe User, type: :model do

  before :example do
  User.destroy_all
  @userX = User.create!( first_name: 'Billy', last_name: 'Bob', email: 'ha@ha.ha', password: 'hahahaha', password_confirmation: 'hahahaha')
  @userY = User.create!( first_name: 'Bobby', last_name: 'Bill', email: 'he@he.he', password: 'hehehehe', password_confirmation: 'hehehehe')
  @userZ = User.create!( first_name: 'Bibby', last_name: 'Boll', email: 'ho@ho.ho', password: 'hohohohoho', password_confirmation: 'hohohohoho')
  end



  describe 'Validations' do

    it 'must have a valid password field' do
      expect(@userY).to be_valid
      @userY.password = nil
      expect(@userY).not_to be_valid
    end

    it 'must have a valid password length' do
      expect(@userY).to be_valid
      @userY.password = "hehehe"
      expect(@userY).not_to be_valid
    end
    it 'password and password-confirmation must match' do
      @userY.password = 'eheheh'
      expect(@userX).to be_valid
      expect(@userY).not_to be_valid
    end
    it 'must have a unique email' do
      @userY.email = 'HA@HA.HA'
      expect(@userX).to be_valid
      expect(@userY).not_to be_valid
    end
    it 'must have an email' do
      @userY.email = nil
      expect(@userX).to be_valid
      expect(@userY).not_to be_valid
    end
    it 'must have a first name' do
      @userY.first_name = nil
      expect(@userX).to be_valid
      expect(@userY).not_to be_valid
    end
    it 'must have a last name' do
      @userY.last_name = nil
      expect(@userX).to be_valid
      expect(@userY).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate with credentials' do
      @userZ.email = '  ho@ho.ho  '
      @user = User.authenticate_with_credentials(@userZ.email, @userZ.password)
      @userNull = User.authenticate_with_credentials('userNullEmail', 'userNullPass')
      expect(@user).not_to be_nil
      expect(@userNull).to be_nil
    end
  end
end
