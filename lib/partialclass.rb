require "partialclass/version"

class Class
	def specialize(*prep)
		this = self
		Class.new(self) do
			define_method(:initialize) { |*args| super(*(prep + args)) }
			define_method(:name)       { |     | this.name; p this             }
		end
	end
	
	def << (prep)
		specialize(prep)
	end
end
