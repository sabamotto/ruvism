module Ruvism
	module RSM
		class String
			def to_quoted
				"'#{self.to_s}'"
			end
		end
	end
end
