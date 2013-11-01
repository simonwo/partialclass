class TestClass
	def initialize(*args); @args = args        end
	def mymethod(*args);   (@args + args).join end
end