module Ruvism
	module CodeManager
		class Register

			unitBits = {
				half: 4, byte: 8, word: 16, dword: 32, qword: 64
			}

			def initialize(syntax)
				@syntax = syntax
				@value = nil
				@unit = :byte
			end
			
			def syntax
				@syntax
			end

			def bits
				Register.unitBits[@unit]
			end
			def bytes
				self.bits/8
			end

			def +@(value)
				@manager.add self, value
			end

			def is_literal?
				false
			end
			alias_method :is_lit?, :is_literal?

			def is_register?
				true
			end
			alias_method :is_reg?, :is_register?

			def is_address?
				false
			end
			alias_method :is_addr?, :is_address?

			def to_s
				@syntax.to_s
			end

		end
	end
end