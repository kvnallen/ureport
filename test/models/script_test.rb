require 'test_helper'

class ScriptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  	test "should has one param" do
  		assert_equal (2, subject.params)
  	end

end
