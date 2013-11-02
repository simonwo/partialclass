require "test/unit"
require_relative "common.rb"
require_relative "../lib/partialclass.rb"

class CorrectnessTests < Test::Unit::TestCase
	def setup
		@Class    = TestClass << 1 << 2 << 3
		@Instance = @Class.new 4, 5, 6
	end

	def test_method_inheritence
		assert_respond_to @Instance, :mymethod
		assert_equal "123456", @Instance.mymethod
	end

	def test_superclass
		assert_equal TestClass, @Class.superclass
		assert @Instance.is_a?    TestClass
		assert @Instance.kind_of? TestClass
	end
end