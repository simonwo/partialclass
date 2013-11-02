require "test/unit"
require_relative "common.rb"
require_relative "../lib/partialclass.rb"

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
