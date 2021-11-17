require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'is not valid if there is no first name' do
      @user = User.new(first_name: nil, last_name: 'Last', email: 'test@test.com', password_digest: 'secret')
      expect(@user).to_not be_valid
    end
    it 'is not valid if there is no last name' do
      @user = User.new(first_name: 'First', last_name: nil, email: 'test@test.com', password_digest: 'secret')
      expect(@user).to_not be_valid
    end
    it 'is not valid if there is no email' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: nil, password_digest: 'secret')
      expect(@user).to_not be_valid
    end



    # it 'is not valid if email is not unique and already exists in the database' do
    # end

    # it { should validate_uniqueness_of(:email).case_sensitive }

    # it 'is not valid if email is not unique' do
    #   @user1 = User.new(first_name: 'First1', last_name: 'Last1', email: 'test@test.com', password_digest: 'secret1')
    #   @user2 = User.new(first_name: 'First2', last_name: 'Last2', email: 'test@test.com', password_digest: 'secret2')
    #   expect(@user2).to_not be_valid
    # end



    it 'is not valid if there is no password' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password_digest: nil)
      expect(@user).to_not be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password: 'supersecret', password_confirmation: 'notsosecret')
      expect(@user).to_not be_valid
    end

    it 'is not valid if password is less than minimum length' do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@test.com', password_digest: 'four')
      expect(@user).to_not be_valid
    end

  end
end
