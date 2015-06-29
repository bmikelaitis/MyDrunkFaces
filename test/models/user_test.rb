require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(firstname: "John", lastname: "Doe", email: "John@example.com")
	end

	test "user should be valid" do
		assert @user.valid?
	end
		
	test "firstname should be present" do
		@user.firstname = " "
		assert_not @user.valid?
	end

	test "firstname should not be too long" do
		@user.firstname = "a" *16
		assert_not @user.valid?
	end

	test "firstname should not be too short" do
		@user.firstname = "a"
		assert_not @user.valid?
	end
	
	test "name should be present" do
		@user.lastname = " "
		assert_not @user.valid?
	end

	test "lastname should not be too long" do
		@user.lastname = "a" *21
		assert_not @user.valid?
	end

	test "lastname should not be too short" do
		@user.lastname = "a"
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = " "
		assert_not @user.valid?
	end

	test "email length should not be too long" do
	@user.email = "a" * 101 + "@example.com"
	assert_not @user.valid?
  end

  test "email address should be unique" do
  	dup_user = @user.dup
  	dup_user.email = @user.email.upcase
  	@user.save
  	assert_not dup_user.valid?
  end

  test "email validation should except valid addresses" do
  	valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
  	valid_addresses.each do |va|
  		@user.email = va
  		assert @user.valid? '#{va.inspect} should be valid'
  	end
  end

  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@example,com user_at_eee.org user.name@example eee@i_am.com foo@eee+aar.com]
  	invalid_addresses.each do |ia|
  		@user.email = ia
  		assert_not @user.valid? '#{ia.inspect} should be invalid'
  	end
  end

end