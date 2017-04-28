require './ruvism'

class Sample 
	include Ruvism:RSM.X86
	def build
		base_bits = 32
		ax = 0
		bx = 1
		label do
			ax = 256
		end

		assemble
	end
end

