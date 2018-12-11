require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    before:each do
      @user = User.new(first_name: 'Weir', last_name: 'Doe', email: 'weir.doe@weir.doe', password: 'password', password_confirmation: 'password')
    end

    it 'is a valid user' do
      expect(@user.errors.full_messages).to be_empty
    end

    it 'is not valid without a first name' do
      @user.first_name = nil
      @user.save
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'is not valid without a last name' do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'is not valid without an email' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'is not valid if the password and password confirmation do not match' do
      @user.password_confirmation = 'wrong_password'
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'is not valid without a password' do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'is not valid without a password confirmation' do
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'is not valid to create a user with an email that is already registered' do
      User.create(first_name: 'Malcolm', last_name: 'Function', email: 'weir.doe@weir.doe', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors.full_messages).to include "Email has already been taken"
    end

    it 'is not valid to create a user with an email that is already registered in a different case' do
      User.create(first_name: 'Malcolm', last_name: 'Function', email: 'WEIR.DOE@weir.doe', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors.full_messages).to include "Email has already been taken"
    end
  end

  describe '.authenticate_with_credentials' do

    before:each do
      @user = User.create(first_name: 'Weir', last_name: 'Doe', email: 'weir.doe@weir.doe', password: 'password', password_confirmation: 'password')
    end

    it 'should log the user in' do
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to eq @user
    end

    it 'should log the user in if there are spaces before/after their email' do
      expect(@user.authenticate_with_credentials("  #{@user.email}   ", @user.password)).to eq @user
    end

    it 'should log the user in if the email is in the wrong case' do
      expect(@user.authenticate_with_credentials(@user.email.upcase, @user.password)).to eq @user
    end

    it 'should not log the user in if the password is wrong' do
      expect(@user.authenticate_with_credentials(@user.email, 'wrong_password')).to be nil
    end

    it 'should not log the user in if the email is not registered' do
      expect(@user.authenticate_with_credentials('wrong@email.com', @user.password)).to be nil
    end

  end

end
