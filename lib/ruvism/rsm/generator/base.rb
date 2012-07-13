module Ruvism
	module Rsm
		class Generator

			def self.create(type = :nasm, *args)
				p @classes
				@classes[type].new(*args)
			end
			# module_function :create

			def self.addGenerator(sym, cla)
				@classes ||= {}
				@classes[sym] = cla
			end
			# module_function :addGenerator

			module Base

				def name
					@name
				end

				def result
					@result
				end

			end

			module Assembler
				# アセンブラ機能付随
			end

			module Converter
				# アセンブラ言語へのコンバータ付随

				def code
					@code
				end

				def filename
					@name+'.asm'
				end

			end

		end
	end
end
