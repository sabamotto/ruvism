# coding: utf-8

# 次世代式プログラミング「LL2ASM」の実験版
# コードネーム: Ruvism (Ruvysm)

# -- 制作システム側 --
# (プログラムコード)
# Rubyコードで作れるようにするメインシステム - after skip
# 機械語調整システム - after skip
# ** X86コード生成システム **
# コードジェネレーター - creating now
# -- 生成システム側 --

# RSM TO NASM CONVERTOR (Code Management)

module Ruvism
	module Rsm
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

		class X86
			include Base

			# new(開始セグメント)
			def initialize(*args)
				name = args[0].is_a?(String) ? args.shift : 'untitled'
				@seg = args[0].is_a?(Integer) ? args.shift : 0x07C0
				opts = args[0].is_a?(Hash) ? args.shift : {}
				opts[:generator] = :nasm unless opts[:generator]
				@gen = Generator.create(opts[:generator], name, 'RSM v.exper1')
				@labels = {}
			end

			def code
				@gen.code
			end

			def name
				@gen.name
			end

			def generator
				@gen
			end

			def assemble
				@gen.assemble
			end

			def ax=(value)
				if value == 0
					@gen.oprand :xor, :register => :ax, :value => :ax
				else
					@gen.oprand :mov, :register => :ax, :value => value
				end
			end
			def bx=(value)
				@gen.oprand :mov, :register => :bx, :value => value
			end
			def cx=(value)
				@gen.oprand :mov, :register => :cx, :value => value
			end
			def dx=(value)
				@gen.oprand :mov, :register => :dx, :value => value
			end

			def label(arg = nil, &block)
				if arg.is_a?(String) or arg.is_a?(Symbol)
					@gen.label arg.to_s
				elsif arg.nil?
					@gen.label
				end
				if block.is_a?(Proc)
					yield
					@gen.nextLine
				end
			end

			def data(*args)
				size = :word
				times = 1
				if args.last.is_a?(Hash)
					opts = args.pop
					size = opts[:size] if opts[:size]
					size = opts[:type] if opts[:type]
					times = opts[:times] if opts[:times]
				end
				# 出力
				1.upto times do
					@gen.oprand :db, args
				end
			end

			def fill_byte(byte = 0, to = 0x01FE)
				@gen.times to
				self.data byte, :type => :byte
			end

			def base_bits=(value)
				@gen.bits value
			end

			def close_interrupt
				@gen.oprand :cli
			end
			alias_method :cli, :close_interrupt

			def start_interrupt
				@gen.oprand :sti
			end
			alias_method :sti, :start_interrupt

			private

			def move_operand(tgt, value, index = nil)
				@gen.oprand :mov, :register => value
			end

		end
	end
end
