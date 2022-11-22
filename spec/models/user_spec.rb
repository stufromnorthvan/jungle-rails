require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should save a new user' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "passwordtest", :password_confirmation => "passwordtest")
      user.save
      expect(user).to be_present
    end

    it 'should not create a new user if e-mail is in use' do
      email = "stu@example2.com"
      user = User.new(:name => "Stu", :email => email, :password => "passwordtest", :password_confirmation => "passwordtest")
      user.save
      user2 = User.new(:name => "Stu", :email => email, :password => "passwordtest", :password_confirmation => "passwordtest")
      user2.save
      expect(user2.errors.full_messages[0]).to be == "Email has already been taken"
    end

    it 'should not create a new user if password confirmation does not match' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "passwordtest", :password_confirmation => "passwordtestt")
      user.save
      expect(user.errors.full_messages[0]).to be == "Password confirmation doesn't match Password"
    end

    it 'should not create a new user if password is too short' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "pass", :password_confirmation => "pass")
      user.save
      expect(user.errors.full_messages[0]).to be == "Password is too short (minimum is 8 characters)"
    end

    it 'user should have a name' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "passwordtest", :password_confirmation => "passwordtest")
      expect(user.name).to be_present
    end

    it 'user should have an email' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "passwordtest", :password_confirmation => "passwordtest")
      expect(user.email).to be_present
    end

    it 'user should have a password' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "passwordtest", :password_confirmation => "passwordtest")
      expect(user.password).to be_present
    end

    it 'user should have a password confirmation' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "passwordtest", :password_confirmation => "passwordtest")
      expect(user.password_confirmation).to be_present
    end

  end

  describe '.authenticate_with_credentials' do

    it 'should take whitespace out of email field' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "passwordtest", :password_confirmation => "passwordtest")
      user.save
      usernew = User.authenticate_with_credentials("stu@example2.com   ", user.password)
      expect(usernew.email).to be == "stu@example2.com"
    end

    it 'should not be case sensitive when logging back in' do
      user = User.new(:name => "Stu", :email => "stu@example2.com", :password => "passwordtest", :password_confirmation => "passwordtest")
      user.save
      usernew = User.authenticate_with_credentials("STU@eXaMpLe2.COM", user.password)
      expect(usernew.email).to be == "stu@example2.com"
    end

  end

end
