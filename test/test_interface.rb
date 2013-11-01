require "test/unit"
require "./common"

class InterfaceTests < Test::Unit::TestCase
	def test_for_single
		assert_respond_to Class, :<<
		assert_respond_to TestClass, :<<
	end 

	def test_for_specialize
		assert_respond_to Class, :specialize
		assert_respond_to TestClass, :specialize
	end
end
