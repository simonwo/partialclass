require "partialclass/version"

class Class
	def specialize(*args)
		_specialize(self, *args)
	end

	def << (arg)
		specialize(arg)
	end

	unless Class.respond_to? :define_singleton_method
		def define_singleton_method name, &block
			metaclass = class << self; self; end
			metaclass.define_method(:name, &block)
		end
	end

	private
	def _specialize(parent, *prep)
		Class.new(parent) do
			define_method(:initialize)           { |*args| super(*(prep + args)) }
			define_singleton_method(:specialize) { |*args|  _specialize(parent, *(prep+args)) }
		end
	end
end
