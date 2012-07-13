module Ruvism
	module RSM
		module Base
			
			def save(filename = nil)
				@filename = filename.nil? ? @gen.filename : filename
				open(@filename, "w") { |io| io.print @gen.code }
			end

			def filename
				@filename
			end

			def filename=(value)
				@filename = value
			end

		end
	end
end
