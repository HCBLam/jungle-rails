require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is not valid if there is no first name' do
      @user = User.new(first_name: nil, last_name: 'Last', email: 'test@test.com', password: 'supersecret', password_confirmation: 'supersecret')
      @user.save
      expect(@user).to_not be_valid
    end
    it 'is not valid if there is no last name' do
      @user = User.new(first_name: 'First', last_name: nil, email: 'test@test.com', password: 'supersecret', password_confirmation: 'supersecret')
      @user.save
      expect(@user).to_not be_valid
    end
    it 'is not valid if there is no email' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: nil, password: 'supersecret', password_confirmation: 'supersecret')
      @user.save
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is not unique' do
      @user1 = User.new(first_name: 'First1', last_name: 'Last1', email: 'test@test.com', password: 'supersecret1', password_confirmation: 'supersecret1')
      @user1.save
      @user2 = User.new(first_name: 'First2', last_name: 'Last2', email: 'test@test.com', password: 'supersecret2', password_confirmation: 'supersecret2')
      @user2.save
      expect(@user2).to_not be_valid
    end

    it 'is not valid if there is no password' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com')
      @user.save
      expect(@user).to_not be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password: 'supersecret', password_confirmation: 'notsosecret')
      @user.save
      expect(@user).to_not be_valid
    end

    it 'is not valid if password is less than minimum length' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password: 'secret', password_confirmation: 'secret')
      @user.save
      expect(@user).to_not be_valid
    end
  end



  describe '.authenticate_with_credentials' do
    it 'authenticates if email and password are valid' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password: 'supersecret1', password_confirmation: 'supersecret1')
      @user.save!
      user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to eq(@user)
    end
    it 'does not authenticate if email is invalid' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password: 'supersecret1', password_confirmation: 'supersecret1')
      @user.save!
      user = User.authenticate_with_credentials('test1@test.com', @user.password)
      expect(user).to_not eq(@user)
    end
    it 'does not authenticate if password is invalid' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password: 'supersecret1', password_confirmation: 'supersecret1')
      @user.save!
      user = User.authenticate_with_credentials(@user.email, 'notsosecret')
      expect(user).to_not eq(@user)
    end
    it 'authenticates if email has whitespace before or after' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password: 'supersecret1', password_confirmation: 'supersecret1')
      @user.save!
      user = User.authenticate_with_credentials('   test@test.com   ', @user.password)
      expect(user).to eq(@user)
    end
    it 'authenticates if email contains different letter cases' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password: 'supersecret1', password_confirmation: 'supersecret1')
      @user.save!
      user = User.authenticate_with_credentials('Test@teSt.cOM', @user.password)
      expect(user).to eq(@user)
    end
  end
end
