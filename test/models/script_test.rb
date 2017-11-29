require 'test_helper'

class ScriptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  

  it "should has one param" do
    subject.params.count eq 2
  end

end
