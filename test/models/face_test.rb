require 'test_helper'

class FaceTest < ActiveSupport::TestCase
	def setup
		@user = User.new(firstname: "bob", lastname:"berry", email:"bob@example.com")
		@face = @user.faces.build(picture: "Chicken Parm", description: "This is the best chicken")
	end

	test "face should be valid" do
		assert @face.valid?
	end
	
	test "user_id should be present" do
		@face.user_id = nil
		assert_not @face.valid?
	end

	test "name should be present" do
		@face.picture = " "
		assert_not @face.valid?
	end

	test "name length should not be too long" do
		@face.picture = "a" * 101
		assert_not @face.valid?
	end

	test "name length should not be too short" do
		@face.picture = "aaa"
		assert_not @face.valid?
	end

	test "description should be present" do
		@face.description = " "
		assert_not @face.valid?
	end

	test "description length should not be too short" do
		@face.description = "a" * 3
		assert_not @face.valid?
	end

	test "description length should not be too long" do
		@face.description = "a" * 121
		assert_not @face.valid?
	end

end